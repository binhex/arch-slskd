# Application

[slskd](https://github.com/slskd/slskd)

## Description

A modern client-server application for the Soulseek file-sharing network.

## Build notes

Latest stable slskd release from GitHub.

## Usage

```bash
docker run -d \
    --name=<container name> \
    -p <host port for slskd web ui http>:8980 \
    -p <host port for slskd web ui https>:8990 \
    -v <path for config files>:/config \
    -v <path for media files>:/media \
    -v <path for data files>:/data \
    -v /etc/localtime:/etc/localtime:ro \
    -e WEBUI_HTTP_PORT=<port> \
    -e WEBUI_HTTPS_PORT=<port> \
    -e WEBUI_USERNAME=<username> \
    -e WEBUI_PASSWORD=<password> \
    -e UPLOAD_SPEED_LIMIT=<int32> \
    -e DOWNLOAD_SPEED_LIMIT=<int32> \
    -e GLUETUN_INCOMING_PORT=<yes|no> \
    -e HEALTHCHECK_COMMAND=<command> \
    -e HEALTHCHECK_ACTION=<action> \
    -e HEALTHCHECK_HOSTNAME=<hostname> \
    -e UMASK=<umask for created files> \
    -e PUID=<uid for user> \
    -e PGID=<gid for user> \
    binhex/arch-slskd
```

Please replace all user variables in the above command defined by <> with the
correct values.

## Access slskd Web UI

`http://<host ip>:8980`

## Example

```bash
docker run -d \
    --name=binhex-slskd \
    -p 8980:8980 \
    -p 8990:8990 \
    -v /home/nobody/config:/config \
    -v /home/nobody/media:/media \
    -v /home/nobody/data:/data \
    -v /etc/localtime:/etc/localtime:ro \
    -e WEBUI_USERNAME=slskd \
    -e WEBUI_PASSWORD=slskd \
    -e UMASK=000 \
    -e PUID=99 \
    -e PGID=100 \
    binhex/arch-slskd
```

## Notes

User ID (PUID) and Group ID (PGID) can be found by issuing the following command
for the user you want to run the container as:-

```bash
id <username>
```

___
If you appreciate my work, then please consider buying me a beer  :D

[![PayPal donation](https://www.paypal.com/en_US/i/btn/btn_donate_SM.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=MM5E27UX6AUU4)

[Documentation](https://github.com/binhex/documentation) | [Support forum](https://forums.unraid.net/topic/124948-support-binhex-crafty-4/)
