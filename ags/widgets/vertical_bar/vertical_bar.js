const hyprland = await Service.import("hyprland")

const date = Variable("", {
    poll: [1000, 'date "+%H %M"'],
})

function Workspaces() {
    const activeId = hyprland.active.workspace.bind("id")
    const workspaces = hyprland.bind("workspaces")
        .as(ws => ws.map(({ id }) => Widget.Button({
            on_clicked: () => hyprland.messageAsync(`dispatch workspace ${id}`),
            child: Widget.Label(`${id}`),
            class_name: activeId.as(i => `${i === id ? "focused" : ""}`),
        })))

    return Widget.Box({
        vertical: true,
        class_name: "workspaces",
        children: workspaces,
    })
}

function Clock() {
    return Widget.Label({
        class_name: "clock",
        label: date.bind(),
    })
}

function Top() {
    return Widget.Box({
        spacing: 2,
        children: [
            Clock(),
        ],
    })
}

function Center() {
    return Widget.Box({
        spacing: 2,
        children: [
            Workspaces(),
        ],
    })
}

function Bottom() {
    return Widget.Box({
        spacing: 2,
        children: [
        ],
    })
}

export function vertical_bar(monitor = 0) {
    return Widget.Window({
        name: `bar-${monitor}`,
        monitor,
        exclusivity: "exclusive",
        anchor: ["left"],
        child: Widget.CenterBox({
            class_name: "vertical_bar",
            vertical: true,
            start_widget: Top(),
            center_widget: Center(),
            end_widget: Bottom(),
        }),
    })
}
