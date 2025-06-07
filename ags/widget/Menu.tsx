import { App, Astal, Gtk, Gdk, hook } from "astal/gtk4"
import { Variable, exec } from "astal";

import Apps from "gi://AstalApps"

const apps = new Apps.Apps()
const text = Variable("")

function AppButton({ app }) {
  return (
    <button 
      cssClasses={["btn"]}
      onClicked={() => {
        App.toggle_window("Menu")
        app.launch()
      }}
    >
      <box>
        <image iconName={app.iconName} />

        <box valign={Gtk.Align.CENTER} vertical>
          <label xalign={0} label={app.name} />
        </box>
      </box>
    </button>
  )
}

function AppList() {
  const list = text((text) => apps.fuzzy_query(text))

  return (
    <Gtk.ScrolledWindow vexpand>
      <box spacing={6} vertical>
        {list.as((list) => list.map((app) => <AppButton app={app} />))}
      </box>
    </Gtk.ScrolledWindow>
  )
}

function SearchEntry() {
  const onEnter = () => {
    App.toggle_window("Menu")
    apps.fuzzy_query(text.get())?.[0].launch()
  }

  return (
    <overlay>
      <box cssClasses={["search-box"]}></box>
      <entry 
        type = "overlay"
        placeholderText = "Search..."
        text={text.get()}
        setup={(self) => {
          hook(self, App, "window-toggled", (_, win) => {
            if (win.name == "Menu" && win.visible) {
              text.set("")
              apps.reload()
              
              self.set_text("")
              self.grab_focus()
            }
          })
        }}
        onChanged={(self) => text.set(self.text)}
        onActivate={onEnter}
      />
    </overlay>
  )
}

export default function Menu() {
  return (
    <window 
      name="Menu" 
      layer={Astal.Layer.OVERLAY}
      keymode={Astal.Keymode.EXCLUSIVE}
      application={App}
      cssClasses={["menu"]}
      onKeyPressed={(_, key) => { 
        if (key == Gdk.KEY_Escape) { App.toggle_window("Menu") } 
      }}
    >
      <box 
        cssClasses={["box"]}
        vertical 
        vexpand={false}
      >
        <SearchEntry />
        <AppList />
      </box>
    </window>
  )
}
