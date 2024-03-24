import { vertical_bar } from "./widgets/vertical_bar/vertical_bar.js";

const css = `${App.configDir}/scss/my-style.css`
Utils.monitorFile(
    `${App.configDir}/scss`,

    function() {
        const scss = `${App.configDir}/scss/style.scss`
        
        Utils.exec(`sassc ${scss} ${css}`)
        App.resetCss()
        App.applyCss(css)
    },
)
App.config({
    style: css,
    windows: [
        vertical_bar(0),
    ],
})

