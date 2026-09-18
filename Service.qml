import QtQuick
import Quickshell.Io

Item {
  id: root

  Process {
    id: runner
    command: ["bash", "-lc",
      "bash \"$HOME/.config/omarchy/plugins/zoltan.auto-nightlight/bin/auto-nightlight\""]
  }

  Timer {
    interval: 60000
    repeat: true
    running: true
    triggeredOnStart: true
    onTriggered: if (!runner.running) runner.running = true
  }
}
