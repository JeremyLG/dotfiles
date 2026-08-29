import QtQuick
import QtQuick.Layouts
import QtQuick.Window
import Quickshell.Hyprland
import qs.Commons
import qs.Ui

BarWidget {
  id: root
  moduleName: "omarchy.workspaces"

  function workspaceById(id) {
    var values = Hyprland.workspaces.values
    for (var i = 0; i < values.length; i++) {
      if (values[i].id === id) return values[i]
    }

    return null
  }

  function workspaceIds() {
    var ids = [1, 2, 3, 4, 5]
    var values = Hyprland.workspaces.values

    for (var i = 0; i < values.length; i++) {
      var id = values[i].id
      if (id > 0 && id <= 10 && ids.indexOf(id) === -1) ids.push(id)
    }

    ids.sort(function(left, right) { return left - right })
    return ids
  }

  function focusWorkspace(id) {
    if (!root.bar) return
    root.bar.run("hyprctl dispatch " + Util.shellQuote("hl.dsp.focus({ workspace = \"" + id + "\" })"))
  }

  readonly property real trailingGap: root.vertical ? 0 : Style.spaceReal(1.5)

  implicitWidth: grid.implicitWidth + trailingGap
  implicitHeight: grid.implicitHeight

  GridLayout {
    id: grid
    anchors.fill: parent
    anchors.rightMargin: root.trailingGap
    columns: root.vertical ? 1 : root.workspaceIds().length
    columnSpacing: root.vertical ? 0 : Style.space(1)
    rowSpacing: root.vertical ? Style.space(2) : 0

    Repeater {
      model: root.workspaceIds()

      Item {
        required property int modelData

        readonly property var workspace: root.workspaceById(modelData)
        readonly property bool occupied: workspace !== null && workspace.toplevels.values.length > 0
        readonly property var barWindow: root.bar && typeof root.bar.targetWindow === "function" ? root.bar.targetWindow(root) : null
        readonly property string screenName: barWindow && barWindow.screen ? String(barWindow.screen.name || "") : ""
        readonly property var barMonitor: {
          if (!screenName) return null
          var mons = Hyprland.monitors.values
          for (var i = 0; i < mons.length; i++) {
            if (mons[i].name === screenName) return mons[i]
          }
          return null
        }
        readonly property bool focused: barMonitor !== null && barMonitor.activeWorkspace !== null && barMonitor.activeWorkspace.id === modelData

        implicitWidth: btn.implicitWidth
        implicitHeight: btn.implicitHeight

        Rectangle {
          anchors.fill: parent
          anchors.margins: 3
          radius: 4
          color: "#3d59a1"
          visible: focused
        }

        WidgetButton {
          id: btn
          active: focused
          activeColor: "#ffffff"
          useActiveColor: focused
          bar: root.bar
          text: modelData === 10 ? "0" : String(modelData)
          opacity: occupied || focused ? 1 : 0.5
          horizontalMargin: 6
          verticalPadding: 6
          fixedWidth: root.vertical ? root.barSize : Style.space(20)
          fixedHeight: root.barSize
          onPressed: function() { root.focusWorkspace(modelData) }
        }
      }
    }
  }
}
