#!/usr/bin/env bash

ovs-vsctl add-port br-int vm1 -- set interface vm1 type=internal

ip netns add vm1
ip link set vm1 netns vm1
ip netns exec vm1 ip link set vm1 address 02:ac:10:ff:00:11
ip netns exec vm1 ip addr add 172.16.255.11/24 dev vm1
ip netns exec vm1 ip link set vm1 up

ovs-vsctl set Interface vm1 external_ids:iface-id=ls1-vm1

ip netns exec vm1 ip addr show
