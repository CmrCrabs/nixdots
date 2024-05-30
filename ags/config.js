import { vertical_bar } from "./widgets/vertical_bar/vertical_bar.js";
import { dock } from "./widgets/dock/dock.js";
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
        vertical_bar(0),
        dock(0),
    ],
})

