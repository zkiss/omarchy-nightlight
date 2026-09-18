# Automatic Night Light

Automatically turns Omarchy's night light on at sunset and off at sunrise using
the system timezone. No network location lookup is used.

Manual on/off changes are respected for up to 12 hours, or until the automatic
schedule reaches the same state.

Install and enable:

```bash
omarchy plugin add https://github.com/zkiss/omarchy-nightlight.git --enable
```
