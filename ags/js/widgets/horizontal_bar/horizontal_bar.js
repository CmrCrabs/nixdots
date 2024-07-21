import { NotificationMusicButton, MiscButton } from "./buttons.js"
import { Battery, Clock } from "./misc.js"
import { Workspaces } from "./workspaces.js"
import { Button } from '../shared/button.js';

function ThemeButton() {
    return Button("wallpaper", "theme_h", "Limitless' Theming Menu", () => App.toggleWindow("theming_menu"));
}

function Top() {
    return Widget.Box({
        hexpand: true,
        children: [
            Clock(),
            NotificationMusicButton(),
            Battery(),
        ],
    })
}

function Center() {
    return Widget.Box({
        hexpand: true,
        children: [
            Workspaces(),
        ],
    })
}

function Bottom() {
    return Widget.Box({
        hpack: "end",
        vpack: "center",
        hexpand: true,
        children: [
            ThemeButton(),
            MiscButton(),
        ],
    })
}

export function HorizontalBar(monitor = 0) {
    return Widget.Window({
        cursor: "default",
        name: `horizontal_bar`,
        layer: "top",
        monitor,
        exclusivity: "exclusive",
        anchor: ["top"],
        child: Widget.CenterBox({
            cursor: "default",
            vpack: "center",
            hpack: "center",
            class_name: "horizontal_bar",
            start_widget: Top(),
            center_widget: Center(),
            end_widget: Bottom(),
        }),
    })
}
