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

    let bar = Widget.LevelBar({
        heightRequest: 100,
        hpack: "center",
        vpack: "center",
        value: value,
        vertical: true,
        class_name: 'batbar',
    }).hook(battery, self => {
      self.toggleClassName('charging', Battery.charging)
    })

    let icon = Widget.Icon({
        class_name: "battery_icon",
        icon: battery.bind('charging').as(ch => ch ? 'battery-charging-symbolic' : 'battery1-symbolic'),
    })

    return Widget.Box({
        hpack: "center",
        vpack: "center",
        vertical: true,
        spacing: 2,
        class_name: "batbox",
        children: [
            icon,
            bar,
        ]
    })
}

