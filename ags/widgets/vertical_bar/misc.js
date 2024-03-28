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
    return Widget.LevelBar({
        widthRequest: 100,
        vertical: true,
        value: battery.bind("percent").as(p => p / 100),
        //class_name: battery.bind('charging').as(ch => ch ? 'batterybar_charging' : 'batterybar'),
        class_name: "batbar",
    })
}
