#!/bin/bash
# Useful commands for troubleshooting EC2 web apps

# --- Service checks ---
# Check the status of the web application
systemctl status webapp
# Restart the web application
sudo systemctl restart webapp
# View the last 50 log entries for the web application
journalctl -u webapp -n 50

# --- Port checks ---
# See which ports the application is listening on
sudo ss -tuln | grep 8080
# Test local access to the web app
curl http://127.0.0.1:8080
curl http://0.0.0.0:8080

# --- Processes ---
# Check running processes related to the web application
ps aux | grep webapp

# --- Database / network tests ---
# Test connectivity to the database (replace placeholders)
nc -zv <DB_HOST> <DB_PORT>
telnet <DB_HOST> <DB_PORT>

# --- EC2 instance checks ---
# Describe the EC2 instance status
aws ec2 describe-instances --instance-ids <INSTANCE_ID>
aws ec2 describe-instance-status --instance-ids <INSTANCE_ID>
# Check security group configuration
aws ec2 describe-security-groups --group-ids <SECURITY_GROUP_ID>



