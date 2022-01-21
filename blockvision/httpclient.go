package main

import (
	"bytes"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
)

var httpClient *http.Client

func init() {
	httpClient = &http.Client{}
}

const bvUrl string = "https://apis.blockvision.org/v1/240296ikIjqhT9OyudPS2eNHPWA"

func doPost() {
	params := make(map[string]interface{})
	params["jsonrpc"] = "2.0"
	params["method"] = "eth_getBalance"
	params["params"] = []string{"0x6aeE2AA1fbfaB47E23360cc30511320Df8f8764E", "latest"}
	content, err := json.Marshal(params)
	if err != nil {
		fmt.Println(err.Error())
		return
	}
	req, err := http.NewRequest("POST", bvUrl, bytes.NewReader(content))
	req.Header.Add("Content-Type", "application/json")
	if err != nil {
		fmt.Println(err.Error())
		return
	}
	resp, err := httpClient.Do(req)
	if err != nil {
		fmt.Println(err.Error())
		return
	}
	defer resp.Body.Close()
	respInfo, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		fmt.Println(err.Error())
		return
	}
	fmt.Println(string(respInfo))
}
