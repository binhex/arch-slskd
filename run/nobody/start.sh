#!/usr/bin/dumb-init /bin/bash

# source in script to wait for child processes to exit
source waitproc.sh

function slskd(){

	local install_path="/opt/slskd"
	local config_path="/config/slskd"

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

	# use env var as cli --shared argument does not support multiple paths
	export SLSKD_SHARED_DIR="${SHARED_PATHS}"

	# run portset and pass app parameters
	portset.sh \
	--app-name "${APPNAME}" \
	--webui-port "${WEBUI_HTTP_PORT}" \
	--app-parameters "${install_path}/slskd" \
	--slsk-username "${SLSK_USERNAME}" \
	--slsk-password "${SLSK_PASSWORD}" \
	--slsk-listen-port "${SLSK_LISTEN_PORT}" \
	--incomplete "${INCOMPLETE_PATH}" \
	--downloads "${DOWNLOADS_PATH}" \
	--username "${WEBUI_USERNAME}" \
	--password "${WEBUI_PASSWORD}" \
	--http-port "${WEBUI_HTTP_PORT}" \
	--https-port "${WEBUI_HTTPS_PORT}" \
	--app-dir "${config_path}" \
	--upload-speed-limit "${UPLOAD_SPEED_LIMIT}" \
	--download-speed-limit "${DOWNLOAD_SPEED_LIMIT}" \
	${remote_configuration} \
	${remote_file_management}

}

function main() {

	echo "[info] Starting ${APPNAME}..."
	slskd

}

# run
main