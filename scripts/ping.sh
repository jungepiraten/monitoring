#!/bin/bash

function warnifoff() {
	ping -c 2 $1 > /dev/null || echo "$1 down"
}

warnifoff "aspiration.junge-piraten.de"
warnifoff "public.aspiration.junge-piraten.de"
warnifoff "community.aspiration.junge-piraten.de"
warnifoff "mitglieder.aspiration.junge-piraten.de"

