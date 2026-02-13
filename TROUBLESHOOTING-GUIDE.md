# Troubleshooting Guide




This document explains my general approach to troubleshooting issues on the EC2 instances during the Cloud Engineering lab.

I usually start by checking if the application is running correctly, then step by step I look for potential issues in network, code, logs, and security settings.



## Step 1: Verify the application status
I first check if the service is running using `systemctl status <service>` and see if any errors are reported.

## Step 2: Check network connectivity
I use `ss -tuln` to check which ports are listening and `curl` or `nc` to test if the application is reachable locally.

## Step 3: Review the code or configuration
If there are service or connectivity issues, I look at the application files (like `app.js`) for misconfigurations, such as wrong listening address or port.

## Step 4: Examine logs
I inspect logs using `journalctl -u <service>` and `tail -f /var/log/messages` to see runtime errors or crashes.

## Step 5: Check security groups and firewall
I ensure that the EC2 security group allows inbound traffic on the correct ports.

## Step 6: Apply fix and validate
Once I make changes, I restart the service and validate with local and remote testing.



