# Automatic Night Light

Automatically sets Omarchy's night light from local sunrise and sunset using
the system timezone. No network location lookup is used.

Manual temperature changes are respected for up to 12 hours. The override ends
earlier as soon as the temperature matches the automatic scheduled value again.

Install and enable:

```bash
omarchy plugin add https://github.com/zkiss/omarchy-nightlight.git --enable
```
