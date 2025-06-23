import { App, Astal, Gtk, Gdk, hook } from "astal/gtk4"
import { Variable, exec } from "astal";
import Apps from "gi://AstalApps"
import AstalWp from "gi://AstalWp"

import { ToggleLatte, ToggleFrappe, ToggleMocha } from "../style"

export default function ControlPanel() {
  const speaker = AstalWp.get_default()!.defaultSpeaker
  const volume = Variable(speaker.get_volume())
  const brightness = Variable(0).watch("brightnessctl get", (out, prv) => parseInt(out))

  speaker.connect("notify::volume", () => {volume.set(speaker.get_volume())})
  brightness.subscribe(value => {exec("brightnessctl set " + value)})

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
            }}>
            <label label={""} />
          </button>

          <button
            cssClasses={["button"]}
            onClicked={() => {
              exec("reboot")
            }}>
            <label label={""} />
          </button>

          <button
            cssClasses={["button"]}
            onClicked={() => {
              exec("systemctl suspend")
            }}>
            <label label={"󰤄"} />
          </button>
        </box>

        <box spacing={5}>
          <button
            cssClasses={["button"]}
            onClicked={() => {
              ToggleLatte()
            }}>
            <label label={"󰖨"} />
          </button>

          <button
            cssClasses={["button"]}
            onClicked={() => {
              ToggleFrappe()
            }}>
            <label label={""} />
          </button>

          <button
            cssClasses={["button"]}
            onClicked={() => {
              ToggleMocha()
            }}>
            <label label={""} />
          </button>
        </box>

        <box spacing={5} hexpand={true} cssClasses={["slider"]}>
          <label label={""} />
          <slider min={0} max={1} step={0.1} hexpand={true}
            value={volume()}
            onValueChanged={self => {
              speaker.set_volume(self.value)
            }}/>
        </box>
        <box spacing={5} hexpand={true} cssClasses={["slider"]}>
          <label label={"󰃟"} valign={Gtk.Align.Center} />
          <slider min={0} max={255} step={1} hexpand={true}
            value={brightness()}
            onValueChanged={self => {
              brightness.set(self.value)
            }}/>
        </box>
      </box>
    </window>
  )
}
