import { NotificationMusicButton, MiscButton } from "./buttons.js"
import { Battery, Clock } from "./misc.js"
import { Workspaces } from "./workspaces.js"
import { Button } from '../shared/button.js';

function ThemeButton() {
    return Button("wallpaper", "theme", "Limitless' Theming Menu", () => print("test"));
}

function Top() {
    return Widget.Box({
        vertical: true,
        vexpand: true,
        children: [
            NotificationMusicButton(),
            ThemeButton(),
        ],
    })
}

function Center() {
    return Widget.Box({
        vertical: true,
            vexpand: true,
        children: [
            Workspaces(),
        ],
    })
}

function Bottom() {
    return Widget.Box({
        vertical: true,
        hpack: "center",
        vpack: "end",
        vexpand: true,
        children: [
            Battery(),
            MiscButton(),
            Clock(),
        ],
    })
}

export function VerticalBar(monitor = 0) {
    return Widget.Window({
        cursor: "default",
        name: `vertical_bar`,
        monitor,
        exclusivity: "exclusive",
        anchor: ["left"],
        child: Widget.CenterBox({
            cursor: "default",
            vpack: "center",
            hpack: "center",
            class_name: "vertical_bar",
            vertical: true,
            start_widget: Top(),
            center_widget: Center(),
            end_widget: Bottom(),
        }),
    })
}
