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
    const value = battery.bind("percent").as((p) => p / 100);

    let bar = Widget.ProgressBar({
        //heightRequest: 100,
        hpack: "center",
        vpack: "center",
        value: value,
        vertical: true,
        //class_name: battery.bind('charging').as(ch => ch ? 'batterybar_charging' : 'batterybar'),
        class_name: "batbar",
    })

    let icon = Widget.Icon({
        icon: "battery-symbolic",
        class_name: "battery_icon"
    })

    return Widget.Box({
        hpack: "center",
        vpack: "center",
        vertical: true,
        spacing: 2,
        children: [
            icon,
            bar,
        ]
    })
}

