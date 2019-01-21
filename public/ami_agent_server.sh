#!/bin/bash
P1=$1
P2=$2

if [ "$P1" = "sip" ]; then
  if [ "$P2" = "offline" ]; then
     /usr/sbin/asterisk -rx'sip show peers'|grep online|awk '{print $12}'|cut -d'/' -f1
  else
     /usr/sbin/asterisk -rx'sip show peers'|grep online|awk '{print $5}'|cut -d'/' -f1
  fi
fi

if [ "$P1" = "pjsip" ]; then
  if [ "$P2" = "offline" ]; then
     /usr/sbin/asterisk -rx'pjsip show endpoints'|grep online|awk '{print $6}'|cut -d'/' -f
  else
     /usr/sbin/asterisk -rx'pjsip show endpoints'|grep online|awk '{print $4}'|cut -d'/' -f1
  fi
fi

if [ "$P1" = "iax" ]; then
  if [ "$P2" = "offline" ]; then
     /usr/sbin/asterisk -rx'iax2 show peers'|grep online|awk '{print $6}'|cut -d'/' -f1
  else
     /usr/sbin/asterisk -rx'iax2 show peers'|grep online|awk '{print $4}'|sed -r 's/[\[]+//g'|cut -d'/' -f1
  fi
fi
