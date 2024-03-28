const hyprland = await Service.import("hyprland")

export function Workspaces() {
    const activeId = hyprland.active.workspace.bind("id")
    const workspaces = hyprland.bind("workspaces")
        .as(ws => ws.map(({ id }) => Widget.Button({
            on_clicked: () => hyprland.messageAsync(`dispatch workspace ${id}`),
            child: Widget.Box({
                class_name: "workspace_box",
                hpack: "center",
                vpack: "center",
                css: "all: unset;",
            }),
            class_name: activeId.as(i => `${i === id ? "workspaces_focused" : "workspaces_unfocused"}`),
            hpack: "center",
            vpack: "center",
        })))

    return Widget.Box({
        vertical: true,
        class_name: "workspaces",
        hpack: "center",
        vpack: "center",
        children: workspaces,
    })
}
