#! /bin/bash

APP_DIR="${HOME}/.himawari8_wallpaper"
PLIST_DIR="${HOME}/Library/LaunchAgents"
PLIST_FILE_NAME="com.vincent.himawari8_wallpaper.launchd.plist"
PLIST_FILE="${PLIST_DIR}/${PLIST_FILE_NAME}"

launchctl unload ${PLIST_FILE}
rm ${PLIST_FILE}
rm -rf ${APP_DIR}
echo "Uninstall Complete."