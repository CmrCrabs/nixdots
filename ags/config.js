import Gio from "gi://Gio";

import { VerticalBar } from "./js/widgets/vertical_bar/vertical_bar.js"; 
import { HorizontalBar } from "./js/widgets/horizontal_bar/horizontal_bar.js"; 
import { Dock } from "./js/widgets/dock/dock.js";
import { SysTray } from "./js/widgets/dock/systray.js";
import { StartMenu } from "./js/widgets/start_menu/start_menu.js";
import { ControlCenter } from "./js/widgets/control_center/control_center.js";
import { MediaCenter } from "./js/widgets/media_center/media_center.js";
import { NotificationPopups } from "./js/widgets/media_center/notifications.js";

const css = `${App.configDir}/my-style.css`
const scss = `${App.configDir}/scss/style.scss`

Utils.monitorFile(
    `${App.configDir}/scss/`,
    (file, event) => {
        if (event !== Gio.FileMonitorEvent.CHANGES_DONE_HINT) return;
        Utils.exec(`sassc ${scss} ${css}`)
        App.resetCss()
        App.applyCss(css)
    },
)

App.addIcons(`${App.configDir}/assets`)

App.config({
    style: css,
    windows: [
        //VerticalBar(0),
        HorizontalBar(0),
        Dock(0),
        StartMenu(0),
        SysTray(0),
        ControlCenter(0),
        MediaCenter(0),
        NotificationPopups(0),
    ],
})
