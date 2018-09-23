# F5 Office 365 Proxy Bypass - Dynamic Update

## What
Use this code to run periodic URL update taken from Microsoft office 365 address-list and store it into F5 datagroup.

## How
####1. Open SSH session and login as admin user
####2. Download office365-dynamic-update.sh by running this command:
```
cd /home/admin
curl -os https://raw.githubusercontent.com/ianwijaya/f5-office365-pb-dynamic-update/master/office365-dynamic-update.sh
```
####3. Create datagroup
```
echo "a" >> /tmp/office365-dg.txt
tmsh
create ltm data-group external O365 type string source-path file:///tmp/office365-dg.txt
```

####4. Create iCall script
```
create sys icall script Drafts/office365-script.txt
modify sys icall script Drafts/office365-script.txt definition {  exec /bin/bash /home/admin/office365-dynamic-update.sh }
```

####5. Create iCall handler
```
create sys icall handler periodic Drafts/office365-handler script Drafts/office365-script.txt interval 3600 status active
``
3600 -> update will run every 1 hour.
