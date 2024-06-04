Disk Space Checker Shell Script
Overview

This shell script automates the process of checking disk space usage on a system and sends an email alert if the usage exceeds a specified threshold. It's designed to help system administrators monitor disk space usage and take proactive measures to prevent potential issues caused by low disk space.
Features

Automated Disk Space Monitoring: The script periodically checks the disk space usage on the system.
Email Alerting: If the disk space usage exceeds a specified threshold, the script sends an email alert to notify the system administrator.
Customizable Threshold: The threshold for disk space usage can be customized according to the system's requirements.
Configurable Email Settings: Email settings such as SMTP server, sender email address, and recipient email address can be configured easily.

Prerequisites

Unix-like Operating System: This script is designed to run on Unix-like operating systems such as Linux and macOS.

Bash Shell: The script is written in Bash, so a Bash-compatible shell is required.

ssmtp: The ssmtp package must be installed to send email alerts. Install it using your package manager if it's not already installed.


Configuration settings for ssmtp.conf :

1- sudo vim /etc/ssmtp/ssmtp.conf

![2](https://github.com/marwantarek11/Ivolve-OJT/assets/167176241/6fcf504b-baad-4d52-9f2c-c0f6e9ab1781)

Result:

![Screenshot 2024-05-28 011946](https://github.com/marwantarek11/Ivolve-OJT/assets/167176241/d991f3fd-1194-4a5f-9e3a-b6edb421948b)
