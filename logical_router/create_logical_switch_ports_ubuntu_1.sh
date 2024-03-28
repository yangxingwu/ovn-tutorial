#!/usr/bin/env bash

ovn-nbctl lsp-add dmz dmz-vm1
ovn-nbctl lsp-set-addresses dmz-vm1 "02:ac:10:ff:01:30 172.16.255.130/26"
ovn-nbctl lsp-set-port-security dmz-vm1 "02:ac:10:ff:01:30 172.16.255.130"

ovn-nbctl lsp-add dmz dmz-vm2
ovn-nbctl lsp-set-addresses dmz-vm2 "02:ac:10:ff:01:31 172.16.255.131/26"
ovn-nbctl lsp-set-port-security dmz-vm2 "02:ac:10:ff:01:31 172.16.255.131"

ovn-nbctl lsp-add inside inside-vm3
ovn-nbctl lsp-set-addresses inside-vm3 "02:ac:10:ff:01:94 172.16.255.194/26"
ovn-nbctl lsp-set-port-security inside-vm3 "02:ac:10:ff:01:94 172.16.255.194"

ovn-nbctl lsp-add inside inside-vm4
ovn-nbctl lsp-set-addresses inside-vm4 "02:ac:10:ff:01:95 172.16.255.195/26"
ovn-nbctl lsp-set-port-security inside-vm4 "02:ac:10:ff:01:95 172.16.255.195"

ovn-nbctl show
