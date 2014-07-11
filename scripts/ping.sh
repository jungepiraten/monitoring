#!/bin/bash

function warnifoff() {
	ping -c 2 $1 > /dev/null || echo "$1 down"
}

warnifoff "aspiration.jupis.net"

