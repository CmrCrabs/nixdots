export function StartWidgets() {
    return Widget.Box({
        class_name: "start_widgets",
        children: [
            Widget.Label({
                class_name: "title",
                label: "REAL",
                xalign: 0,
                vpack: "center",
                truncate: "end",
            }),
        ],
    })
}
