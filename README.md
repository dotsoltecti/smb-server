# smb-server  
A simple Docker container based on Alpine Linux (latest stable version), running an SMB server.  
A new image will be automatically released whenever the Samba package version in Alpine changes.  

## 🚀 Usage  

To create a container from this image, you can use **Docker Compose**.  
The available environmental variables allow you to configure the SMB server to suit your needs.  

⚠️ **Important:** You must provide a valid `smb.conf` file for the container to function correctly.  

### **Example `docker-compose.yml` Configuration**  

```yaml
---
services:
    samba:
        image: ghcr.io/dotsoltecti/smb-server:latest
        container_name: samba
        environment:
            - "SMB_UID=1000"  # Default: 1000
            - "SMB_GID=1000"  # Default: 1000
            - "SMB_GROUP=smbgroup"  # Default: smbgroup
            - "SMB_USER=smbuser"  # Default: smbuser
            - "SMB_PASS=smbuserpw"  # Default: smbuserpw
            - "SMB_DEBUGLEVEL=1"  # Value between 1 (less verbose) and 5 (very verbose). Default: 1
        volumes:
            - ./smb.conf:/etc/samba/smb.conf  # Required SMB configuration
        ports:
            - 139:139
            - 445:445
        restart: unless-stopped
```
## ⚠️ Disclaimer  

I am **not a professional developer**, and this project is provided **as is**.  Although it should be safe to run the image, use at your **own risk**.  
There will be **no or very limited support** in case of issues.

## 📜 License  
This project is open-source and available under the [MIT License](LICENSE).  
