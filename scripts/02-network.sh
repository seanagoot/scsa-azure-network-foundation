#!/bin/bash

# Project 1 - Azure Network Foundation
# Virtual Network and Subnets

# Create Virtual Network
az network vnet create \
  --resource-group rg-scsa-prod \
  --name vnet-scsa-prod \
  --address-prefixes 10.10.0.0/16 \
  --location southeastasia

# Create Web Subnet
az network vnet subnet create \
  --resource-group rg-scsa-prod \
  --vnet-name vnet-scsa-prod \
  --name snet-web \
  --address-prefixes 10.10.1.0/24

# Create Management Subnet
az network vnet subnet create \
  --resource-group rg-scsa-prod \
  --vnet-name vnet-scsa-prod \
  --name snet-management \
  --address-prefixes 10.10.2.0/24
