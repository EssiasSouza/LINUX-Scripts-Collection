#!/bin/bash

# Capture the first argument passed to the script
code=$1

echo "$code"

rm log_file_management.txt
rm -fv /path/.$code/mailbox/file.txt >> log_file_management.txt
rm -fv /path/.$code/mailbox/file.jpg >> log_file_management.txt
