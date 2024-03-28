#!/usr/bin/env bash

ovs-vsctl add-port br-int vm2 -- set interface vm2 type=internal

ip netns add vm2
ip link set vm2 netns vm2
ip netns exec vm2 ip link set vm2 address 02:ac:10:ff:00:22
ip netns exec vm2 ip addr add 172.16.255.22/24 dev vm2
ip netns exec vm2 ip link set vm2 up

ovs-vsctl set Interface vm2 external_ids:iface-id=ls1-vm2

ip netns exec vm2 ip addr show
