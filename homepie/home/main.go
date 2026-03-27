package main

import (
	"context"
	"fmt"
	"net"
	"os"
	"time"

	"github.com/go-telegram/bot"
	"github.com/go-telegram/bot/models"
	"github.com/paraskun/ctl/dns"
	"github.com/paraskun/ctl/wol"
	"golang.org/x/crypto/ssh"
	"golang.org/x/net/icmp"
	"golang.org/x/net/ipv4"
)

const (
	ID     = 757286788
	Zone   = "7b409208302d8beafc2751d931bac08e"
	Record = "c5715153684ae315b6db2f7ecb08dc0d"
)

type Machine struct {
	NetworkAddr  net.IP
	HardwareAddr net.HardwareAddr
}

var hardware = []Machine{
	{
		NetworkAddr:  []byte{192, 168, 0, 37},
		HardwareAddr: []byte{0xa8, 0xa1, 0x59, 0x01, 0x07, 0x75},
	},
}

func main() {
	b, err := bot.New(os.Getenv("HOMPIE_TOKEN"),
		bot.WithDefaultHandler(handler))

	if err != nil {
		panic(err)
	}

	b.Start(context.Background())
}

func handler(ctx context.Context, b *bot.Bot, u *models.Update) {
	if u.Message.Chat.ID != ID {
		return
	}

	switch u.Message.Text {
	case "/update":
		update(ctx, b, u)
	case "/status":
		status(ctx, b, u)
	case "/wakeup":
		wakeup(ctx, b, u)
	case "/shutdown":
		shutdown(ctx, b, u)
	default:
		b.SendMessage(ctx, &bot.SendMessageParams{
			ChatID: u.Message.Chat.ID,
			Text:   u.Message.Text,
		})
	}
}

func status(ctx context.Context, b *bot.Bot, u *models.Update) {
	con, err := icmp.ListenPacket("ip4:icmp", "0.0.0.0")

	if err != nil {
		b.SendMessage(ctx, &bot.SendMessageParams{
			ChatID: u.Message.Chat.ID,
			Text:   err.Error(),
		})

		return
	}

	msg := icmp.Message{
		Type: ipv4.ICMPTypeEcho,
		Code: 0,
		Body: &icmp.Echo{
			ID:  os.Getpid() & 0xffff,
			Seq: 1,
		},
	}

	bin, err := msg.Marshal(nil)

	if err != nil {
		b.SendMessage(ctx, &bot.SendMessageParams{
			ChatID: u.Message.Chat.ID,
			Text:   err.Error(),
		})

		return
	}

	con.WriteTo(bin, &net.IPAddr{
		IP: hardware[0].NetworkAddr,
	})

	buf := make([]byte, 1500)
	res := false

	req, cancel := context.WithTimeout(context.Background(), 3*time.Second)
	defer cancel()

	for {
		if err := req.Err(); err != nil {
			break
		}

		con.SetReadDeadline(time.Now().Add(3 * time.Second))
		_, _, err = con.ReadFrom(buf)

		if err != nil {
			continue
		}

		msg, err := icmp.ParseMessage(ipv4.ICMPTypeEcho.Protocol(), buf)

		if err != nil {
			continue
		}

		switch msg.Type {
		case ipv4.ICMPTypeEchoReply:
			res = true
			cancel()
		}
	}

	b.SendMessage(ctx, &bot.SendMessageParams{
		ChatID: u.Message.Chat.ID,
		Text:   fmt.Sprintf("%v: %v", hardware[0].NetworkAddr.String(), res),
	})
}

func wakeup(ctx context.Context, b *bot.Bot, u *models.Update) {
	if err := wol.SendTo(hardware[0].HardwareAddr); err != nil {
		b.SendMessage(ctx, &bot.SendMessageParams{
			ChatID: u.Message.Chat.ID,
			Text:   err.Error(),
		})
	} else {
		b.SendMessage(ctx, &bot.SendMessageParams{
			ChatID: u.Message.Chat.ID,
			Text:   "Gotcha!",
		})
	}
}

func update(ctx context.Context, b *bot.Bot, u *models.Update) {
	addr, err := dns.ResolveAddress()

	if err != nil {
		b.SendMessage(ctx, &bot.SendMessageParams{
			ChatID: u.Message.Chat.ID,
			Text:   err.Error(),
		})

		return
	}

	cli := &dns.Client{
		Token: os.Getenv("CLOUDFLARE_TOKEN"),
	}

	if err := cli.OverwriteRecord(Zone, Record, &dns.OverwriteRecordRequest{
		Name:    "home.paraskun.space",
		Type:    "A",
		Ttl:     3600,
		Content: addr,
		Proxied: false,
	}); err != nil {
		b.SendMessage(ctx, &bot.SendMessageParams{
			ChatID: u.Message.Chat.ID,
			Text:   err.Error(),
		})

		return
	}

	b.SendMessage(ctx, &bot.SendMessageParams{
		ChatID: u.Message.Chat.ID,
		Text:   fmt.Sprintf("home.paraskun.space -> %s", addr),
	})
}

func shutdown(ctx context.Context, b *bot.Bot, u *models.Update) {
	cli, err := ssh.Dial("tcp", hardware[0].NetworkAddr.String()+":22", &ssh.ClientConfig{
		User: "paraskun",
		Auth: []ssh.AuthMethod{
			ssh.Password("Gemini.1106"),
		},
		HostKeyCallback: ssh.InsecureIgnoreHostKey(),
	})

	if err != nil {
		b.SendMessage(ctx, &bot.SendMessageParams{
			ChatID: u.Message.Chat.ID,
			Text:   err.Error(),
		})

		return
	} else {
		defer cli.Close()
	}

	session, err := cli.NewSession()

	if err != nil {
		b.SendMessage(ctx, &bot.SendMessageParams{
			ChatID: u.Message.Chat.ID,
			Text:   err.Error(),
		})

		return
	} else {
		defer session.Close()
	}

	if err := session.Run("sudo shutdown +3"); err != nil {
		b.SendMessage(ctx, &bot.SendMessageParams{
			ChatID: u.Message.Chat.ID,
			Text:   err.Error(),
		})

		return
	}

	b.SendMessage(ctx, &bot.SendMessageParams{
		ChatID: u.Message.Chat.ID,
		Text:   "Shutdown is scheduled in 3 minutes.",
	})
}
