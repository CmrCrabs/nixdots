import { VerticalBar } from "./widgets/vertical_bar/vertical_bar.js"; 
import { Dock } from "./widgets/dock/dock.js";
import { SysTray } from "./widgets/dock/systray.js";
import { StartMenu } from "./widgets/start_menu/start_menu.js";
import { PowerMenu } from "./widgets/powermenu/powermenu.js";
import { ControlCenter } from "./widgets/control_center/control_center.js";
import { MediaCenter } from "./widgets/media_center/media_center.js";
import { NotificationPopups } from "./widgets/media_center/notifications.js";

const css = `${App.configDir}/scss/my-style.css`
const scss = `${App.configDir}/scss/style.scss`

Utils.monitorFile(
    `${App.configDir}/`,

    function() {
        Utils.exec(`sassc ${scss} ${css}`)
        App.resetCss()
        App.applyCss(css)
    },
)

App.addIcons(`${App.configDir}/assets`)

App.config({
    style: css,
    windows: [
        VerticalBar(0),
        Dock(0),
        StartMenu(0),
        SysTray(0),
        PowerMenu(0),
        ControlCenter(0),
        MediaCenter(0),
        NotificationPopups(0),
    ],
})

while (true) {
    setTimeout(1000);
    Utils.exec(`sassc ${scss} ${css}`)
    App.resetCss()
    App.applyCss(css)
}
