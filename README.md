# Automatic Night Light

This local Omarchy plugin bundles the automatic night-light implementation.
It uses the active system timezone and the local IANA timezone database, never
network location lookup.

At graphical login, the startup service calls `auto-nightlight startup`. That
path ignores any stale manual override and immediately applies the temperature
appropriate for the current time.

The timer then calls `auto-nightlight periodic` each minute. Periodic runs
respect manual temperature changes: a value different from the last automatic
value pauses automation, while setting it back to the current scheduled value
resumes it. If `hyprsunset` itself has to be restarted, the scheduled value is
restored because the process default is not treated as user intent.

The live systemd user units in `~/.config/systemd/user/` are copies of the
templates in `systemd/`; the active units run this plugin's bundled script.
