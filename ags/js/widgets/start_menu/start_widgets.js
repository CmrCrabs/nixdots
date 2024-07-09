import { Media } from "./media.js"
import { ControlSliders } from "./control_sliders.js"

export function StartWidgets() {
    return Widget.Box({
        class_name: "start_widgets",
        vertical: true,
        hpack: "center",
        vpack: "center",
        children: [
            ControlSliders(),
            Media(),
        ],
    })
}
