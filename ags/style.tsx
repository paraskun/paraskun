import { App } from "astal/gtk4"
import { exec } from "astal"

export function ToggleMocha() {
  exec("/home/paraskun/.config/ags/script/mocha.sh")
  App.apply_css("/tmp/mocha.css")
}

export function ToggleFrappe() {
  exec("/home/paraskun/.config/ags/script/frappe.sh")
  App.apply_css("/tmp/frappe.css")
}

export function ToggleLatte() {
  exec("/home/paraskun/.config/ags/script/latte.sh")
  App.apply_css("/tmp/latte.css")
}
