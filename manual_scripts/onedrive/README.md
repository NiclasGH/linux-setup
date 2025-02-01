# Mounting OneDrive with rclone

Before you start: If you dont want any changes to the startup.sh, copy the startup.sh somewhere to your liking 

1. Install rclone manually or using the setup script
2. Run `rclone config`
3. Add new remote
4. Name the remote
5. Choose kind of remote
6. Login through your browser
7. Create folder in your home directory: `OneDrive`
7. Run `crontab -e`
8. Add: `@reboot ~/path/to/script`