import { App } from "astal/gtk4"
import Launcher from "./widget/Launcher"
import ControlPanel from "./widget/ControlPanel"
import Bar from "./widget/Bar"
import { exec } from "astal/process"

exec("ln -sf /home/paraskun/.config/ags/style/mocha.scss /tmp/flavour.scss")
exec("sass -I /home/paraskun/.config/ags -I /tmp /home/paraskun/.config/ags/style.scss /tmp/mocha.css")

exec("ln -sf /home/paraskun/.config/ags/style/frappe.scss /tmp/flavour.scss")
exec("sass -I /home/paraskun/.config/ags -I /tmp /home/paraskun/.config/ags/style.scss /tmp/frappe.css")

exec("ln -sf /home/paraskun/.config/ags/style/latte.scss /tmp/flavour.scss")
exec("sass -I /home/paraskun/.config/ags -I /tmp /home/paraskun/.config/ags/style.scss /tmp/latte.css")

App.start({
    css: "/tmp/frappe.css",
    main() {
      Bar()
      Launcher()
      ControlPanel()
    },
})
