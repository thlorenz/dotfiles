set outputA to 1
set outputB to 4

tell application "System Preferences"
	activate
	set current pane to pane "com.apple.preference.sound"
end tell


tell application "System Events"
	tell application process "System Preferences"
		repeat until exists tab group 1 of window "Sound"
		end repeat
		tell tab group 1 of window "Sound"
			click radio button "Output"
			if (selected of row outputA of table 1 of scroll area 1) then
				set selected of row outputB of table 1 of scroll area 1 to true
			else
				set selected of row outputA of table 1 of scroll area 1 to true
			end if
		end tell
	end tell
end tell

tell application "System Preferences" to quit
