import { Media } from "./media.js"

export function StartWidgets() {
    return Widget.Box({
        class_name: "start_widgets",
        vertical: true,
        hpack: "center",
        vpack: "center",
        children: [
            Widget.Box({
            class_name: "real",
            child: Widget.Label({
                    class_name: "title",
                    label: "REAL",
                    xalign: 0,
                    vpack: "center",
                    truncate: "end",
                }),
            }),
            Media(),
        ],
    })
}
