# 🔐 Auto Backup & Email Notification on Ubuntu

Automatically backup a folder daily and send email notifications about success or failure to your Gmail account, using `cron`, `tar`, and `msmtp`.

## 📦 Features

* Automatically compress a folder into `.tar.gz`
* Save backups to external drives or custom folders
* Send Gmail notifications after each backup
* Schedule daily backups using `cron`
* Secure Gmail SMTP support (no need for Postfix)

---

## 🧪 System Requirements

* Ubuntu (tested on 22.04+)
* Installed packages: `msmtp`, `mailutils`, `cron`
* A Gmail account with an App Password

---

## 🛠 Setup Instructions

### 1. Install required packages

```bash
sudo apt update
sudo apt install msmtp msmtp-mta mailutils cron
```

> If prompted about "AppArmor" or "Postfix config", select **No**

---

### 2. Generate Gmail App Password

Go to: [https://myaccount.google.com/apppasswords](https://myaccount.google.com/apppasswords)
→ Create a 16-character app password → Use it in the next step

---

### 3. Configure Gmail SMTP (`~/.msmtprc`)

Add the following to the file `~/.msmtprc`:

```ini
defaults
auth on
tls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt
logfile ~/.msmtp.log

account gmail
host smtp.gmail.com
port 587
from your_email@gmail.com
user your_email@gmail.com
password your_app_password

account default : gmail
```

> Replace `your_email@gmail.com` with your real Gmail
> Replace `your_app_password` with the 16-character app password you created

Then:

```bash
chmod 600 ~/.msmtprc
```

---

### 4. Run a test backup

```bash
chmod +x backup_daily.sh
./backup_daily.sh
```

---

### 5. Set up daily cron job

Open crontab:

```bash
crontab -e
```

Add this line to run the backup daily at 3:00 AM:

```bash
0 3 * * * /your_folder/backup_daily.sh
```

> Replace `/your_folder/backup_daily.sh` with the full path to your script

---


