#!/bin/bash

# Project 1 - Azure Network Foundation
# Network Security Groups and Rules

# Create Web NSG
az network nsg create \
  --resource-group rg-scsa-prod \
  --name nsg-web \
  --location southeastasia

# Create Management NSG
az network nsg create \
  --resource-group rg-scsa-prod \
  --name nsg-management \
  --location southeastasia

# Allow HTTP traffic to Web subnet
az network nsg rule create \
  --resource-group rg-scsa-prod \
  --nsg-name nsg-web \
  --name Allow-HTTP-Inbound \
  --priority 100 \
  --source-address-prefixes Internet \
  --source-port-ranges '*' \
  --destination-address-prefixes '*' \
  --destination-port-ranges 80 \
  --access Allow \
  --protocol Tcp \
  --direction Inbound

# Allow SSH only from the Virtual Network
az network nsg rule create \
  --resource-group rg-scsa-prod \
  --nsg-name nsg-management \
  --name Allow-SSH-From-VNet \
  --priority 100 \
  --source-address-prefixes VirtualNetwork \
  --source-port-ranges '*' \
  --destination-address-prefixes '*' \
  --destination-port-ranges 22 \
  --access Allow \
  --protocol Tcp \
  --direction Inbound

# Associate Web NSG with Web subnet
az network vnet subnet update \
  --resource-group rg-scsa-prod \
  --vnet-name vnet-scsa-prod \
  --name snet-web \
  --network-security-group nsg-web

# Associate Management NSG with Management subnet
az network vnet subnet update \
  --resource-group rg-scsa-prod \
  --vnet-name vnet-scsa-prod \
  --name snet-management \
  --network-security-group nsg-management
