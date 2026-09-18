# Automatic Night Light

This Omarchy service plugin provides automatic sunrise/sunset night-light
scheduling without network location lookup. It derives coordinates from the
active system timezone and the local IANA timezone database.

When the plugin service starts, it runs `auto-nightlight startup`, which clears
any stale manual override and immediately applies the temperature appropriate
for the current time.

While the service remains loaded, it runs `auto-nightlight periodic` once per
minute. Periodic runs respect manual temperature changes: a value different
from the last automatic value pauses automation, while setting it back to the
current scheduled value resumes it. If `hyprsunset` is not running, the plugin
starts it and restores the scheduled temperature instead of treating its
initial value as user intent.

No separate systemd setup is required. Installing and enabling the plugin is
sufficient:

```bash
omarchy plugin add https://github.com/zkiss/omarchy-nightlight.git --enable
```
