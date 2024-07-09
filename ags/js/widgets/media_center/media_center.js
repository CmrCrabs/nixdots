import { Media } from './media.js';
import { NotificationCenter } from './notifications_tray.js';
const WINDOW_NAME = "media_center";

export function MediaCenter(monitor = 0) {
    return Widget.Window({
        name: WINDOW_NAME,
        monitor,
        anchor: ["left", "top"],
        exclusivity: "normal",
        visible: false,
        child: Widget.Box({
            class_name: 'media_center',
            vertical: true,
            hpack: "center",
            vpack: "center",
            children: [
                NotificationCenter(),
                Media(),
            ],
        }),
        setup: self => {
            self.keybind("Escape", () => {
                App.closeWindow(WINDOW_NAME)
            });
        },
    })
}
