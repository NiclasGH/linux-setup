# Step 1
Setup rclone config
```
rclone config create --obscure <NAME> webdav url=https://nas.local:5006 vendor=owncloud pacer_min_sleep=0.01ms user=<USERNAME> pass=<PASSWORD>
```

# Step 2
Install the example systemctl file to `~/.config/systemd/user/`, adjust the config name and mount it
