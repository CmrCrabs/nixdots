import { AppLauncher } from "./app_launcher.js"
import { PowerMenu } from "./powermenu.js"
const WINDOW_NAME = "start_menu"

export function StartMenu(monitor = 0) {
    return Widget.Window({
        name: `start_menu`,
        cursor: "default",
        monitor,
        keymode: "exclusive",
        anchor: ["bottom"],
        exclusivity: "normal",
        visible: false,
        child: Widget.Box({
            class_name: "start_menu",
            hpack: "center",
            vpack: "center",
            children: [
                AppLauncher(),
                PowerMenu(),
            ],
        }),
        setup: self => {
            self.keybind("Escape", () => {
                App.closeWindow(WINDOW_NAME)
            });
        },
    })
}
