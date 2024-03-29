const date = Variable("", {
    poll: [1000, 'date "+%H\n%M"'],
})
export function Clock() {
    return Widget.Label({
        class_name: "clock",
        hpack: "center",
        vpack: "start",
        label: date.bind(),
    })
}
    
const battery = await Service.import('battery')
export function Battery() {
    const value = battery.bind("percent").as((p) => p.toString());

    let bar = Widget.LevelBar({
        heightRequest: 100,
        hpack: "center",
        vpack: "center",
        value: value,
        vertical: true,
        class_name: battery.bind('charging').as(ch => ch ? 'batbar_charging' : 'batbar'),
    })

    let label = Widget.Label({
        hpack: "center",
        vpack: "center",
        label: value,
        justification: "center",
        class_name: battery.bind('charging').as(ch => ch ? 'batlabel_charging' : 'batlabel'),
    })

    let icon = Widget.Icon({
        icon: "battery-symbolic",
        class_name: battery.bind('charging').as(ch => ch ? 'battery_icon_charging' : 'battery_icon'),
    })

    return Widget.Box({
        hpack: "center",
        vpack: "center",
        vertical: true,
        spacing: 2,
        class_name: "batbox",
        children: [
            icon,
            label,
        ]
    })
}

