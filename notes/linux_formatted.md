
# Linux Notes for Reference

In this document, I've added various bash snippets, tips, and other useful pieces of knowledge that might help me navigate the **insane POWAH** of Linux.

---

## Table of Contents

- [Command & Bash Snippets](#command--bash-snippets)
- [System Tools and 3rd Party Utilities](#system-tools-and-3rd-party-utilities)
  - [Xinitrc](#xinitrc)
  - [Tips & Tricks](#tips--tricks)
  - [ProtonVPN Connections](#protonvpn-connections)
  - [Setting up Torrent Server VM](#setting-up-torrent-server-vm)
  - [Redirect Both STDOUT and STDERR](#redirect-both-stdout-and-stderr)
  - [Piping](#piping)
  - [Tar Snippets](#tar-snippets)
  - [Systemd](#systemd)
  - [Rc.local](#rclocal)
  - [Systemd Unit File](#systemd-unit-file)
  - [Crontab](#crontab)
  - [init.d](#initd)
  - [chkconfig: 345 99 10](#chkconfig-345-99-10)
  - [xrandr](#xrandr)
  - [Move Monitor to the Right of Another](#move-monitor-to-the-right-of-another)
  - [SSH Tips](#ssh-tips)
  - [File Permissions & Ownership](#file-permissions--ownership)
  - [Grep Examples](#grep-examples)
  - [Sed Examples](#sed-examples)

---

## Command & Bash Snippets

Here are some useful command-line snippets:

### Redirect Both STDOUT and STDERR

```bash
command > file 2>&1
```

This command redirects both the **standard output** and **standard error** to a file.

### Piping

You can chain commands together using pipes. For example:

```bash
command1 | command2
```

### Tar Snippets

Create a tar archive and compress it:

```bash
tar -czvf archive.tar.gz /path/to/directory
```

Extract a tar.gz file:

```bash
tar -xzvf archive.tar.gz
```

## System Tools and 3rd Party Utilities

### Xinitrc

The `.xinitrc` file can be used to configure what happens when you start X manually. Example configuration:

```bash
#!/bin/sh
exec i3
```

This will start the **i3 window manager** when you run `startx`.

### Tips & Tricks

- You can use `Ctrl + R` in the terminal to search through your command history.
- Use `!!` to run the last command again.

### ProtonVPN Connections

Connect to ProtonVPN using CLI:

```bash
protonvpn-cli connect
```

### Setting up Torrent Server VM

1. Install **qBittorrent** on the virtual machine:

    ```bash
    sudo apt install qbittorrent-nox
    ```

2. Enable the Web UI for remote control:

    ```bash
    qbittorrent-nox --webui-port=8080
    ```

### Systemd

To check the status of a service:

```bash
sudo systemctl status service_name
```

To enable a service to start on boot:

```bash
sudo systemctl enable service_name
```

To start a service manually:

```bash
sudo systemctl start service_name
```

### Rc.local

The `rc.local` file is used to execute commands at system startup. Example:

```bash
#!/bin/sh
/path/to/your/script.sh
exit 0
```

### Systemd Unit File

Example of a simple `systemd` unit file:

```ini
[Unit]
Description=My Service

[Service]
ExecStart=/usr/bin/my-service

[Install]
WantedBy=multi-user.target
```

### Crontab

To schedule a cron job, edit the crontab file with `crontab -e`. Example of a job that runs every day at midnight:

```bash
0 0 * * * /path/to/your/script.sh
```

---

## More Snippets and Examples

Check other sections like **SSH Tips**, **xrandr**, **chkconfig**, and more for various Linux commands and utilities.

---
