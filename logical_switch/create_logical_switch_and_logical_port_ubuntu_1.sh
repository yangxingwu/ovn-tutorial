#!/usr/bin/env bash

ovn-nbctl ls-add ls1

ovn-nbctl lsp-add ls1 ls1-vm1
ovn-nbctl lsp-set-addresses ls1-vm1 02:ac:10:ff:00:11
ovn-nbctl lsp-set-port-security ls1-vm1 02:ac:10:ff:00:11

ovn-nbctl lsp-add ls1 ls1-vm2
ovn-nbctl lsp-set-addresses ls1-vm2 02:ac:10:ff:00:22
ovn-nbctl lsp-set-port-security ls1-vm2 02:ac:10:ff:00:22

ovn-nbctl show
