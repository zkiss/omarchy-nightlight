# Automatic Night Light

This local Omarchy plugin bundles the automatic night-light implementation.
It uses the active system timezone and the local IANA timezone database, never
network location lookup. It starts in the correct state at graphical login and
checks each minute.

Manual temperatures are respected during the running system session. A
different temperature pauses automation; setting it back to the current
scheduled value resumes it. A fresh boot or fresh `hyprsunset` process resets
the manual override and immediately applies the scheduled temperature.

The live systemd user units in `~/.config/systemd/user/` are copies of the
templates in `systemd/`; the active unit runs this plugin's bundled script.
