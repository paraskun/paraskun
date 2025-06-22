import { App, Astal, Gtk, Gdk, hook } from "astal/gtk4"
import { Variable, exec } from "astal";
import Apps from "gi://AstalApps"

import { ToggleLatte, ToggleFrappe, ToggleMocha } from "../style"

export default function ControlPanel() {
  return (
    <window 
      name="ControlPanel" 
      layer={Astal.Layer.OVERLAY}
      keymode={Astal.Keymode.EXCLUSIVE}
      application={App}
      cssClasses={["control-panel"]}
      onKeyPressed={(_, key) => { 
        if (key == Gdk.KEY_Escape) { App.toggle_window("ControlPanel") } 
      }}
    >
      <box 
        cssClasses={["box"]}
        vexpand={false}
        spacing={5}
        vertical
      >
        <box spacing={5}>
          <button
            cssClasses={["button"]}
            onClicked={() => {
              exec("systemctl poweroff")
            }}
          >
            <label label={""} />
          </button>

          <button
            cssClasses={["button"]}
            onClicked={() => {
              exec("reboot")
            }}
          >
            <label label={""} />
          </button>

          <button
            cssClasses={["button"]}
            onClicked={() => {
              exec("systemctl suspend")
            }}
          >
            <label label={"󰤄"} />
          </button>
        </box>
        <box spacing={5}>
          <button
            cssClasses={["button"]}
            onClicked={() => {
              ToggleLatte()
            }}
          >
            <label label={"󰖨"} />
          </button>

          <button
            cssClasses={["button"]}
            onClicked={() => {
              ToggleFrappe()
            }}
          >
            <label label={""} />
          </button>

          <button
            cssClasses={["button"]}
            onClicked={() => {
              ToggleMocha()
            }}
          >
            <label label={""} />
          </button>
        </box>
      </box>
    </window>
  )
}
