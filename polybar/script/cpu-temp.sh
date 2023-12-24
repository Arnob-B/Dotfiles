#!/bin/sh
sensors | grep -m 1 Tctl | awk '{print substr($2, 2, length($2)-4)}'
