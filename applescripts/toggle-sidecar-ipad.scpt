tell application "System Preferences"
	activate
	reveal pane id "com.apple.preference.sidecar"
	delay 1
	try
		tell application "System Events" to click first menu button of first window of application process "System Preferences" of application "System Events"
		tell application "System Events" to click first menu item of first menu of first menu button of first window of application process "System Preferences" of application "System Events"
	on error msg
		tell application "System Events" to click first button of first window of application process "System Preferences" of application "System Events"
		
	end try
	quit
end tell
