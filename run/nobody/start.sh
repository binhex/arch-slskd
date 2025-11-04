#!/usr/bin/dumb-init /bin/bash

install_path="/opt/slskd"
config_path="/config/slskd"

# set boolean flags
if [[ "${REMOTE_CONFIGURATION}" == 'true' ]]; then
	remote_configuration='--remote-configuration'
else
	remote_configuration=""
fi

if [[ "${REMOTE_FILE_MANAGEMENT}" == 'true' ]]; then
	remote_file_management='--remote-file-management'
else
	remote_file_management=""
fi

# create paths
mkdir -p \
"${INCOMPLETE_PATH}" \
"${DOWNLOADS_PATH}" \
"${config_path}"

# run app
"${install_path}/slskd" \
--slsk-username "${SLSK_USERNAME}" \
--slsk-password "${SLSK_PASSWORD}" \
--shared "${SHARED_PATHS}" \
--slsk-listen-port "${SLSK_LISTEN_PORT}" \
--incomplete "${INCOMPLETE_PATH}" \
--downloads "${DOWNLOADS_PATH}" \
--username "${WEBUI_USERNAME}" \
--password "${WEBUI_PASSWORD}" \
--http-port "${WEBUI_HTTP_PORT}" \
--https-port "${WEBUI_HTTPS_PORT}" \
--app-dir "${config_path}" \
${remote_configuration} \
${remote_file_management}
