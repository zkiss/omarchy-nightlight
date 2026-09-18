import QtQuick
import Quickshell
import Quickshell.Io

Item {
  Process {
    id: runner
    command: [Quickshell.env("HOME")
      + "/.config/omarchy/plugins/zoltan.auto-nightlight/bin/auto-nightlight"]
  }

  Timer {
    interval: 60000
    repeat: true
    running: true
    triggeredOnStart: true
    onTriggered: runner.running = true
  }
}
