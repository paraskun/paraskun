package dns

import (
	"bytes"
	"encoding/json"
	"fmt"
	"io"
	"net/http"
)

func ResolveAddress() (string, error) {
	res, err := http.Get("http://ifconfig.me/ip")

	if err != nil {
		return "", err
	}

	pay, err := io.ReadAll(res.Body)

	if err != nil {
		return "", err
	}

	return string(pay), nil
}

const (
	CloudflareBaseAddr = "https://api.cloudflare.com/client/v4"
)

type Client struct {
	Token string
}

type OverwriteRecordRequest struct {
	Name    string `json:"name"`
	Ttl     int    `json:"ttl"`
	Type    string `json:"type"`
	Comment string `json:"comment,omitempty"`
	Content string `json:"content"`
	Proxied bool   `json:"proxied"`
}

func (cli *Client) OverwriteRecord(zone string, id string, pay *OverwriteRecordRequest) error {
	body, err := json.Marshal(pay)

	if err != nil {
		return err
	}

	url := CloudflareBaseAddr + "/zones/" + zone + "/dns_records/" + id
	req, err := http.NewRequest(http.MethodPut, url, bytes.NewReader(body))

	if err != nil {
		return err
	}

	req.Header.Add("Content-Type", "application/json")
	req.Header.Add("Authorization", "Bearer "+cli.Token)

	res, err := http.DefaultClient.Do(req)

	if err != nil {
		return err
	} else {
		defer res.Body.Close()
	}

	if res.StatusCode != 200 {
		msg, err := io.ReadAll(res.Body)

		if err != nil {
			return err
		}

		println(string(msg))

		return fmt.Errorf("There is Application Programming Interface exception occurred. Status code: %d.", res.StatusCode)
	}

	return nil
}
