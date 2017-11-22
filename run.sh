#!/bin/bash
/sbin/sshd &
/sbin/httpd -D FOREGROUND
