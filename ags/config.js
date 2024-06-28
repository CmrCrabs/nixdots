import { VerticalBar } from "./widgets/vertical_bar/vertical_bar.js"; 
import { Dock, SysTray } from "./widgets/dock/dock.js";
import { StartMenu } from "./widgets/start_menu/start_menu.js";
import { NotificationPopups } from "./widgets/notifications/notifications.js";
import { NotificationCenter } from "./widgets/notifications/notifications_tray.js";
import { PowerMenu } from "./widgets/powermenu/powermenu.js";
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
        NotificationPopups(0),
        NotificationCenter(0),
        PowerMenu(0),
    ],
})

while (true) {
    setTimeout(1000);
    Utils.exec(`sassc ${scss} ${css}`)
    App.resetCss()
    App.applyCss(css)
}
