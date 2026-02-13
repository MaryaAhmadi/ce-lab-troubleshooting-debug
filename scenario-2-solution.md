# Scenario 2: Web App Accessible Only on Localhost

## Problem
The web application was running, but I could not access it from my browser. `curl` locally worked, but external connections failed.

## Investigation
1. Checked the listening address: `sudo ss -tuln | grep 8080`.
2. Confirmed the app was listening on 127.0.0.1 instead of 0.0.0.0.
3. Verified security group inbound rules: port 8080 was open to 0.0.0.0/0.

## Solution
- Edited `/home/ec2-user/webapp/app.js`:
  ```js
  server.listen(8080, '0.0.0.0', () => {
      console.log('Server running on http://0.0.0.0:8080');
  });

Restarted the service: sudo systemctl restart webapp.


Result
The application became accessible externally. Note: After confirmation, I reverted the change as instructed.





