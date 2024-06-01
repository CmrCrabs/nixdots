import { VerticalBar } from "./widgets/vertical_bar/vertical_bar.js"; 
import { Dock } from "./widgets/dock/dock.js";
import { StartMenu } from "./widgets/start_menu/start_menu.js";
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
    ],
})
