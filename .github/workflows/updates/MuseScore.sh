#!/bin/bash

webVer=$(curl -s --header "Authorization: token $GH_PERSONAL_ACCESS_TOKEN" "https://api.github.com/repos/musescore/MuseScore/releases/latest" | jq -r '.assets | .[].browser_download_url' | grep aarch64.AppImage$ | sed 's;https://github.com/musescore/MuseScore/releases/download/v'.*'/MuseScore-Studio-;;g' | sed 's;-aarch64.AppImage;;g')
armhf_url="https://github.com/musescore/MuseScore/releases/download/v${webVer%.*}/MuseScore-Studio-${webVer}-armv7l.AppImage"
arm64_url="https://github.com/musescore/MuseScore/releases/download/v${webVer%.*}/MuseScore-Studio-${webVer}-aarch64.AppImage"

source $GITHUB_WORKSPACE/.github/workflows/update_github_script.sh
