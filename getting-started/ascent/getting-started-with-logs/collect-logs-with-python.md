---
description: Log Ingestion via Python (No Agent Required)
---

# Collect Logs with Python

## Overview

This guide explains how to ingest test logs into your Apica Ascent endpoint using a lightweight Python script — no agent installation required. Python comes preinstalled on most systems or can be added easily, making this a simple and flexible option for initial integrations or testing.

### Prerequisites

* Python 3.x installed on your system
  * **macOS**: Usually preinstalled. Run python3 --version to check.
  * **Windows/Linux**: Download from [https://www.python.org](https://www.python.org) if not installed.
* Internet connectivity
* A valid **Bearer token** for authentication ([Generating a secure ingest token](https://docs.apica.io/integrations/overview/generating-a-secure-ingest-token))
* Sample log file (ingestlogs.txt or similar)

## Step 1: Create the Python Script

Create a file named ingest.py and paste the following code:

```
import requests
import time
import sys
import os
from datetime import datetime
 
BEARER_TOKEN = 'paste_token_here'  # Replace this with your actual token
API_ENDPOINT = 'https://mydomain.apica.io/v1/json_batch'
MAX_RETRIES = 3
RETRY_DELAY = 2  # seconds
 
headers = {
    'Authorization': f'Bearer {BEARER_TOKEN}',
    'Content-Type': 'application/json'
}
 
success_count = 0
failure_count = 0
total_lines = 0
 
def post_log(line):
    global success_count, failure_count
    payload = {'log': line.strip()}
    for attempt in range(1, MAX_RETRIES + 1):
        try:
            response = requests.post(API_ENDPOINT, headers=headers, json=payload, timeout=10)
            if 200 <= response.status_code < 300:
                print(f"✅ Sent | Status: {response.status_code}")
                success_count += 1
                return
            else:
                print(f"⚠️ Attempt {attempt}: HTTP {response.status_code}: {response.text}")
        except requests.exceptions.RequestException as e:
            print(f"❌ Attempt {attempt}: Exception - {e}")
       
        if attempt < MAX_RETRIES:
            print(f"🔁 Retrying in {RETRY_DELAY} seconds...")
            time.sleep(RETRY_DELAY)
 
    failure_count += 1
    print("⛔ Failed to send line after retries.")
 
def main(log_file):
    global total_lines
    if not os.path.isfile(log_file):
        print(f"🚫 File not found: {log_file}")
        return
 
    start_time = datetime.now()
    print(f"📤 Starting log ingestion from: {log_file}")
    print(f"🕒 Start Time: {start_time.strftime('%Y-%m-%d %H:%M:%S')}\n")
 
    with open(log_file, 'r') as f:
        for line in f:
            if line.strip():
                total_lines += 1
                post_log(line)
 
    end_time = datetime.now()
    duration = (end_time - start_time).total_seconds()
 
    print("📊 Ingestion Summary")
    print("--------------------------")
    print(f"🕒 Start Time        : {start_time.strftime('%Y-%m-%d %H:%M:%S')}")
    print(f"🕒 End Time          : {end_time.strftime('%Y-%m-%d %H:%M:%S')}")
    print(f"⏱️ Duration (seconds): {duration:.2f}")
    print(f"📄 Total Lines Read  : {total_lines}")
    print(f"✅ Successfully Sent : {success_count}")
    print(f"❌ Failed to Send    : {failure_count}")
    print("--------------------------")
 
if __name__ == '__main__':
    if len(sys.argv) != 2:
        print("Usage: python ingest.py /path/to/ingestlogs.txt")
    else:
        main(sys.argv[1])
```

## Step 2: Customize the Script

1. Replace paste\_token\_here with your actual Bearer token.
2. Update https://mydomain.apica.io/v1/json\_batch if your API endpoint is different.

## Step 3: Prepare Your Log File

Create a plain text file (e.g., ingestlogs.txt) where each line represents one log entry:

```
Log line 1
Log line 2
Error occurred at 2024-06-23
Application restarted
```

## Step 4: Run the Script

```
✅ macOS/Linux
python3 ingest.py /path/to/ingestlogs.txt
✅ Windows (Command Prompt)
python ingest.py /path/to/ingestlogs.txt
📈 Sample Output
📤 Starting log ingestion from: ingestlogs.txt
🕒 Start Time: 2025-06-23 11:32:14
 
✅ Sent | Status: 200
✅ Sent | Status: 200
...
 
📊 Ingestion Summary
--------------------------
🕒 Start Time        : 2025-06-23 11:32:14
🕒 End Time          : 2025-06-23 11:32:16
⏱️ Duration (seconds): 2.12
📄 Total Lines Read  : 5
✅ Successfully Sent : 5
❌ Failed to Send    : 0
```

## Use Cases

* Quick validation of log ingestion
* Proof-of-concept before deploying agents
* CI/CD pipeline log publishing
* Lightweight ingestion in containerized workflows

## Need Help?

Connect with your Apica representative or support team for any further assistance.
