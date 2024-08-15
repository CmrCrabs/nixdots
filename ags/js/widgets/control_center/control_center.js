import { ControlSlider } from './sliders.js';
import { ControlMenu } from './control_menu.js';
const WINDOW_NAME = "control_center";

export function ControlCenter(monitor = 0) {
    return Widget.Window({
        name: WINDOW_NAME,
        monitor,
        anchor: ["left", "bottom"],
        exclusivity: "ignore",
        class_name: "control_center",
        layer: "overlay",
        visible: false,
        margins: [50,0,0,80],
        // 70 + $outer_gap
        child: Widget.Box({
            class_name: 'control_center',
            vertical: true,
            children: [
                ControlSlider(),
                ControlMenu(),
            ],
        }),
        setup: self => {
            self.keybind("Escape", () => {
                App.closeWindow(WINDOW_NAME)
            });
        },
    })
}
