const date = Variable("", {
    poll: [1000, 'date "+%H\n%M"'],
})
export function Clock() {
    return Widget.Label({
        class_name: "clock_h",
        hpack: "center",
        vpack: "center",
        label: date.bind(),
    })
}
    
const battery = await Service.import('battery')
export function Battery() {
    const value = battery.bind("percent").as((p) => p / 100);

    let bar = Widget.CircularProgress({
        vexpand: false,
        hpack: "center",
        vpack: "center",
        value: value,
        rounded: true,
        startAt: 0.0,
        class_name: 'bat_progress_h',
        class_name: battery.bind('charging').as(ch => ch ? 'bat_progress_charging' : 'bat_progress'),
    })

    let icon = Widget.Icon({
        class_name: "bat_icon_h",
        icon: battery.bind('charging').as(ch => ch ? 'battery-charging-symbolic' : 'battery1-symbolic'),
    })

    return Widget.Box({
        class_name: "batbox_h",
        vexpand: false,
        tooltip_text: battery.bind("percent").as(p => `${p}%`),
        child: Widget.Overlay({
            vexpand: false,
            hpack: "center",
            vpack: "center",
            child: bar,
            overlays: [ 
                icon,
            ],
        }),
    })
}

