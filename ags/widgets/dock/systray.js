const systemtray = await Service.import("systemtray")

export function SysTray(monitor = 0) {
    const items = systemtray.bind("items")
        .as(items => items.map(item => Widget.Button({
        class_name: "sys_app_btn",
        child: Widget.Icon({ icon: item.bind("icon"), class_name: "sys_app_icon", size: 30, }),
            on_primary_click: (_, event) => {
                App.closeWindow("systray")
                item.activate(event).catch()
            },
            on_secondary_click: (_, event) => item.openMenu(event).catch(),
            tooltip_markup: item.bind("tooltip_markup"),
        })))
    const itembox = Widget.Box({
        class_name: "systray_box",
        children: items,
    })

    return Widget.Window({
        name: `systray`,
        monitor,
        anchor: ["bottom", "right"],
        exclusivity: "ignore",
        visible: false,
        child: itembox,
    })
}
