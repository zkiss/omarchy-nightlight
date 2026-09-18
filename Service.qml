import QtQuick
import Quickshell.Io

Item {
  id: root

  function run(mode) {
    if (runner.running) return
    runner.command = [
      "bash",
      "-lc",
      "bash \"$HOME/.config/omarchy/plugins/zoltan.auto-nightlight/bin/auto-nightlight\" " + mode
    ]
    runner.running = true
  }

  Process {
    id: runner
    running: false
    command: []
  }

  Timer {
    interval: 60000
    repeat: true
    running: true
    onTriggered: root.run("periodic")
  }

  Component.onCompleted: root.run("startup")
}
