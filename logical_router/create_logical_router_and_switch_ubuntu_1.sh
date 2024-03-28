#!/usr/bin/env bash

# add logical switches
ovn-nbctl ls-add dmz
ovn-nbctl ls-add inside

# add logical router
ovn-nbctl lr-add tenant1

# create router port for the connection to dmz
ovn-nbctl lrp-add tenant1 tenant1-dmz 02:ac:10:ff:01:29 172.16.255.129/26

# create the dmz switch port for connection to tenant1
ovn-nbctl lsp-add dmz dmz-tenant1
ovn-nbctl lsp-set-type dmz-tenant1 router
ovn-nbctl lsp-set-addresses dmz-tenant1 02:ac:10:ff:01:29
ovn-nbctl lsp-set-options dmz-tenant1 router-port=tenant1-dmz

# create router port for the connection to inside
ovn-nbctl lrp-add tenant1 tenant1-inside 02:ac:10:ff:01:93 172.16.255.193/26

# create the inside switch port for connection to tenant1
ovn-nbctl lsp-add inside inside-tenant1
ovn-nbctl lsp-set-type inside-tenant1 router
ovn-nbctl lsp-set-addresses inside-tenant1 02:ac:10:ff:01:93
ovn-nbctl lsp-set-options inside-tenant1 router-port=tenant1-inside

ovn-nbctl show
