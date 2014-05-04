#!/usr/bin/env sh

# gmail
~/chromium/Chromium.app/Contents/MacOS/Chromium    \
  --app=https://mail.google.com/mail/u/0                \
  > /dev/null 2>&1 &

~/chromium/Chromium.app/Contents/MacOS/Chromium    \
  --app=https://mail.google.com/mail/u/1                \
  > /dev/null 2>&1 &

#slack
~/chromium/Chromium.app/Contents/MacOS/Chromium    \
  --app=https://nodesource.slack.com/messages/education \
  > /dev/null 2>&1 &
