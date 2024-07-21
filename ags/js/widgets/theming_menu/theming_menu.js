import { ThemeSliders } from './sliders.js';
//import { ThemeSwitches } from './switches.js';
const WINDOW_NAME = "theming_menu";

export function ThemingMenu(monitor = 0) {
    return Widget.Window({
        name: WINDOW_NAME,
        monitor,
        anchor: ["right", "top"],
        exclusivity: "ignore",
        layer: "overlay",
        visible: false,
        child: Widget.Box({
            class_name: 'theming_menu',
            vertical: true,
            children: [
                ThemeSliders(),
                //ThemeSwitches(),
            ],
        }),
        setup: self => {
            self.keybind("Escape", () => {
                App.closeWindow(WINDOW_NAME)
            });
        },
    })
}
