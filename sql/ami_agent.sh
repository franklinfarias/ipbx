#!/bin/bash

P1=$1

if [ "$P1" = "sip" ]; then
  asterisk -rx'sip show peers'| grep online|awk '{print $6}'| cut -d'/' -f1
fi

if [ "$P1" = "pjsip" ]; then
  asterisk -rx'sip show peers'| grep online|awk '{print $6}'| cut -d'/' -f1
fi

if [ "$P1" = "iax" ]; then
  asterisk -rx'iax2 show peers'| grep online|awk '{print $6}'| cut -d'/' -f1
fi

