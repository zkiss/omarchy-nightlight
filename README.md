# Automatic Night Light

This Omarchy service plugin provides automatic sunrise/sunset night-light
scheduling without network location lookup. It derives coordinates from the
active system timezone and the local IANA timezone database.

The service runs the same check once when it loads and then once per minute.
There is no separate startup mode or systemd setup.

Manual temperature changes are respected for up to 12 hours. The override is
stored as persistent Omarchy state, so it can survive a shell restart or reboot.
If the current temperature starts matching the value automation would choose,
the override is cleared immediately. Changing the manual temperature again
restarts the 12-hour override window.

The last temperature applied automatically is kept only as runtime state. This
lets the plugin distinguish a manual change from a sunrise/sunset transition
without carrying stale automatic state across sessions.

If `hyprsunset` is not running, the plugin starts it and restores a still-valid
manual override; otherwise it applies the scheduled temperature.

Installing and enabling the plugin is sufficient:

```bash
omarchy plugin add https://github.com/zkiss/omarchy-nightlight.git --enable
```
