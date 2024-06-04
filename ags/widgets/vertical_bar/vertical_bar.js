import { ControlsButton, MiscButton, NotificationButton, PowerButton, WallpaperButton } from "./buttons.js"
import { Battery, Clock } from "./misc.js"
import { Workspaces } from "./workspaces.js"

function Top() {
    return Widget.Box({
        spacing: 2,
        vertical: true,
        vexpand: true,
        children: [
            PowerButton(),
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
            vexpand: true,
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
            vexpand: true,
        children: [
            WallpaperButton(),
            NotificationButton(),
            MiscButton(),
            ControlsButton(),
        ],
    })
}

export function VerticalBar(monitor = 0) {
    return Widget.Window({
        name: `vertical_bar`,
        monitor,
        exclusivity: "exclusive",
        anchor: ["left"],
        child: Widget.CenterBox({
            vexpand: true,
            class_name: "vertical_bar",
            vertical: true,
            start_widget: Top(),
            center_widget: Center(),
            end_widget: Bottom(),
        }),
    })
}
