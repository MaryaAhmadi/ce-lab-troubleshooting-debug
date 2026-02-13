# Scenario 3: Application Crashes After 30 Seconds

## Problem
The web application on the EC2 instance (IP: 100.31.87.125) starts successfully but crashes after around 30 seconds.  
The error in the logs shows: "Cannot connect to database".

## Investigation
1. Checked the running processes:
   ```bash
   ps aux | grep webapp


2.Verified the service status:
systemctl status webapp

3.Reviewed the recent logs for errors:
journalctl -u webapp -n 50


4.Checked which ports the app was listening on:
sudo ss -tuln | grep 8080


5.Tested network connectivity to the database port:
nc -zv <DB_HOST> <DB_PORT>
telnet <DB_HOST> <DB_PORT>


Solution
Found that the web application could not reach the database because either the database service was down or the connection parameters were incorrect.
Updated the database hostname and credentials in the application configuration.
Made sure the database was running and accessible from the EC2 instance (100.31.87.125).

Restarted the web application:
sudo systemctl restart webapp


Result
The application now runs continuously without crashing and connects successfully to the database
