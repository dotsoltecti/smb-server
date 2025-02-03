#!/bin/sh

# Set default values if environment variables are not provided
SMB_UID=${SMB_UID:-1000}
SMB_GID=${SMB_GID:-1000}

SMB_GROUP=${SMB_GROUP:-smbgroup}
SMB_USER=${SMB_USER:-smbuser}
SMB_PASS=${SMB_PASS:-smbuserpw}
SMB_DEBUGLEVEL=${SMB_DEBUGLEVEL:-1}

# Create group and user with configurable UID and GID
addgroup -S "$SMB_GROUP" --gid "$SMB_GID"
adduser -S "$SMB_USER" --uid "$SMB_UID"

# Add SMB user and set password
adduser -D -H $SMB_USER
echo -e "$SMB_PASS\n$SMB_PASS" | smbpasswd -s -a "$SMB_USER"

# Start smbd in foreground
exec /usr/sbin/smbd -F --debug-stdout --no-process-group --debuglevel=$SMB_DEBUGLEVEL
