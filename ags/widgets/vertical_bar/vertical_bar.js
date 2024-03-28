import { controls_button, misc_button, notification_button, power_button } from "./buttons.js"
import { Battery, Clock } from "./misc.js"
import { Workspaces } from "./workspaces.js"

function Top() {
    return Widget.Box({
        spacing: 2,
        vertical: true,
        children: [
            power_button(),
            Clock(),
            Battery(),
            //287 pixel from top
        ],
    })
}

function Center() {
    return Widget.Box({
        spacing: 2,
        vertical: true,
        children: [
            Workspaces(),
        ],
    })
}

function Bottom() {
    return Widget.Box({
        spacing: 2,
        vertical: true,
        hpack: "center",
        vpack: "end",
        children: [
            notification_button(),
            misc_button(),
            controls_button(),
        ],
    })
}

export function vertical_bar(monitor = 0) {
    return Widget.Window({
        name: `bar-${monitor}`,
        monitor,
        exclusivity: "exclusive",
        anchor: ["left"],
        child: Widget.CenterBox({
            class_name: "vertical_bar",
            vertical: true,
            start_widget: Top(),
            center_widget: Center(),
            end_widget: Bottom(),
        }),
    })
}
