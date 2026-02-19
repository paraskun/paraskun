package wol

import (
	"net"
)

const (
	Broadcast = "255.255.255.255:7"
)

func SendTo(addr net.HardwareAddr) error {
	var buf [102]byte

	for i := range 6 {
		buf[i] = 0xff
	}

	for i := range 16 {
		o := (i + 1) * 6

		for j := range 6 {
			buf[o+j] = addr[j]
		}
	}

	con, err := net.Dial("udp", Broadcast)

	if err != nil {
		return err
	}

	if _, err := con.Write(buf[:]); err != nil {
		return err
	}

	return nil
}
