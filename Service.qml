import QtQuick

// Scheduling is deliberately handled by the bundled systemd user timer. That
// means it applies at graphical login even before the Omarchy bar is ready.
Item {}
