#!/usr/bin/env bash

dmzDHCP="$(ovn-nbctl create DHCP_Options cidr=172.16.255.128/26 \
	options="\"server_id\"=\"172.16.255.129\" \"server_mac\"=\"02:ac:10:ff:01:29\" \
  \"lease-time\"=\"3600\" \"router\"=\"172.16.255.129\"")"

echo "${dmzDHCP}"

insideDHCP="$(ovn-nbctl create DHCP_Options cidr=172.16.255.192/26 \
	options="\"server_id\"=\"172.16.255.193\" \"server_mac\"=\"02:ac:10:ff:01:93\" \
  \"lease-time\"=\"3600\" \"router\"=\"172.16.255.193\"")"

echo "${insideDHCP}"

ovn-nbctl dhcp-options-list
