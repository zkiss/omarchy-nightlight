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

## Install or update the systemd units

The live systemd user units in `~/.config/systemd/user/` are copies of the
templates bundled with the plugin. After installing or updating the plugin, run:

```bash
mkdir -p ~/.config/systemd/user
cp ~/.config/omarchy/plugins/zoltan.auto-nightlight/systemd/omarchy-auto-nightlight* \
   ~/.config/systemd/user/

systemctl --user daemon-reload
systemctl --user enable --now \
  omarchy-auto-nightlight-startup.service \
  omarchy-auto-nightlight.timer
```

The startup service applies the correct state immediately and on each graphical
login; the timer performs the periodic checks afterwards.
