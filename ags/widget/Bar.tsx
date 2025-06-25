import { Gtk, App, Astal } from "astal/gtk4"
import { Variable, bind, exec } from "astal"
import { ToggleMocha, ToggleFrappe, ToggleLatte } from "../style"

import Hyprland from "gi://AstalHyprland"
import WirePlumber from "gi://AstalWp"

function Launcher() {
  return (
    <button
      cssClasses={["button"]}
      onClicked={() => {
        App.toggle_window("Launcher")
      }}
    >
      <label label={"󰀻"} />
    </button>
  )
}

function Workspace({ ws }) {
  const hypr = Hyprland.get_default()
  const classes = Variable.derive(
    [bind(hypr, "focused-workspace"), bind(hypr, "clients")],
    (fws, _) => {
      const c = ["workspace", "circular"]

      if (ws.id == fws.id) {
        c.push("active")
      }

      return c
    }
  )

  return (
    <button 
      cssClasses={classes()}
      valign={Gtk.Align.CENTER}
      halign={Gtk.Align.CENTER}
      onClicked={() => ws.focus()}
    />
  )
}

function Workspaces() {
  return (
    <box 
      cssClasses={["workspaces"]}
      spacing={4}
    >
      {Array.from({ length: 3 }, (_, i) => i).map((i) => (
        <Workspace ws={Hyprland.Workspace.dummy(i + 1, null)} />
      ))}
    </box>
  )
}

function Time() {
  const time = Variable("").poll(60000, ["date", "+%H:%M"])

  return (<label label={time()}/>)
}

function Date() {
  const date = Variable("").poll(60000, ["date", "+%a, %b %d"])

  return (<label label={date()}/>)
}

function ControlPanel() {
  return (
    <button
      cssClasses={["button"]}
      onClicked={() => {
        App.toggle_window("ControlPanel")
      }}
    >
      <label label={""} />
    </button>
  )
}

function Start() {
  return (
    <box halign={Gtk.Align.START}>
      <Launcher />
      <Gtk.Separator cssClasses={["sep"]}/>
      <Workspaces />
    </box>
  )
}

function Center() {
  return (
    <box>
      <Time />
    </box>
  )
}

function End() {
  return (
    <box halign={Gtk.Align.END}>
      <Date />
      <Gtk.Separator cssClasses={["sep"]}/>
      <ControlPanel />
    </box>
  )
}

export default function Bar() {
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor

  return (
    <window
      name="Bar"
      visible
      anchor={TOP | LEFT | RIGHT}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      application={App}
      cssClasses={["bar"]}
    >
      <centerbox cssClasses={["window", "box"]} >
        <Start />
        <Center />
        <End />
      </centerbox>
    </window>
  )
}
