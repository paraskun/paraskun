import { App, Astal, Gtk, Gdk, hook } from "astal/gtk4"
import { Variable, exec } from "astal";
import Apps from "gi://AstalApps"

export default function Launcher() {
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
      >
        <label label="Control"/>
      </box>
    </window>
  )
}
