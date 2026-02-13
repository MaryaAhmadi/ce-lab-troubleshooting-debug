# Scenario 1: Web Application Not Running



I noticed the web application wasn't running, so I followed these steps to troubleshoot.


## Problem
The web application service on the EC2 instance was not active. Running `systemctl status webapp` showed it was inactive.

## Steps Taken
1. Verified the service status: `systemctl status webapp`.
2. Checked the application logs: `journalctl -u webapp`.
3. Restarted the service: `sudo systemctl restart webapp`.
4. Confirmed it was running: `systemctl status webapp`.

## Result
After restarting, the service was active and the application was running successfully.



