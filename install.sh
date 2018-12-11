#! /bin/bash

echo "Install begin..."

APP_DIR="${HOME}/.himawari8_wallpaper"
PLIST_DIR="${HOME}/Library/LaunchAgents"
PLIST_FILE_NAME="com.vincent.himawari8_wallpaper.launchd.plist"
PROGRAM_FILE_NAME="himawari8_wallpaper.sh"
PLIST_FILE="${PLIST_DIR}/${PLIST_FILE_NAME}"

echo "${PLIST_FILE}"

mkdir -p ${APP_DIR}
echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" > ${PLIST_FILE}
echo "<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">" >> ${PLIST_FILE}
echo "<plist version=\"1.0\">" >> ${PLIST_FILE}
echo "<dict>" >> ${PLIST_FILE}
echo "  <key>Label</key>" >> ${PLIST_FILE}
echo "  <string>${PLIST_FILE_NAME}</string>" >> ${PLIST_FILE}
echo "  <key>EnvironmentVariables</key>" >> ${PLIST_FILE}
echo "  <dict>" >> ${PLIST_FILE}
echo "      <key>PATH</key>" >> ${PLIST_FILE}
echo "      <string>${PATH}</string>" >> ${PLIST_FILE}
echo "  </dict>" >> ${PLIST_FILE}
echo "  <key>ProgramArguments</key>" >> ${PLIST_FILE}
echo "  <array>" >> ${PLIST_FILE}
echo "      <string>${APP_DIR}/${PROGRAM_FILE_NAME}</string>" >> ${PLIST_FILE}
echo "  </array>" >> ${PLIST_FILE}
echo "  <key>RunAtLoad</key>" >> ${PLIST_FILE}
echo "  <true/>" >> ${PLIST_FILE}
echo "  <key>StartInterval</key>" >> ${PLIST_FILE}
echo "  <integer>600</integer>" >> ${PLIST_FILE}
echo "  <key>StandardOutPath</key>" >> ${PLIST_FILE}
echo "  <string>${APP_DIR}/out.log</string>" >> ${PLIST_FILE}
echo "  <key>StandardErrorPath</key>" >> ${PLIST_FILE}
echo "  <string>${APP_DIR}/err.log</string>" >> ${PLIST_FILE}
echo " </dict>" >> ${PLIST_FILE}
echo "</plist>" >> ${PLIST_FILE}

echo "Config LaunchAgents..."

echo "#! /bin/bash" > "${APP_DIR}/${PROGRAM_FILE_NAME}"
echo "" >> "${APP_DIR}/${PROGRAM_FILE_NAME}"
echo "APP_DIR=${HOME}/.himawari8_wallpaper" >> "${APP_DIR}/${PROGRAM_FILE_NAME}"
echo "" >> "${APP_DIR}/${PROGRAM_FILE_NAME}"
echo "minutes=\$(date +%M)" >> "${APP_DIR}/${PROGRAM_FILE_NAME}"
echo "tmp=\`expr \${minutes} / 10\`" >> "${APP_DIR}/${PROGRAM_FILE_NAME}"
echo "name=\`expr \${minutes} - \${tmp}\`" >> "${APP_DIR}/${PROGRAM_FILE_NAME}"
echo "himawari-bg-mac -z 5 -s all -o \"${APP_DIR}/\${name}.jpg\"" >> "${APP_DIR}/${PROGRAM_FILE_NAME}"

chmod u+x "${APP_DIR}/${PROGRAM_FILE_NAME}"
launchctl load ${PLIST_FILE}

echo "Install Complete."