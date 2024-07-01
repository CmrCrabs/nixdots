const hyprland = await Service.import("hyprland")

export function Workspaces() {
    const activeId = hyprland.active.workspace.bind("id")
    const workspaces = hyprland.bind("workspaces")
    .as(ws => ws
        .sort((a, b) => a.id - b.id)
        .map(({ id }) => Widget.Button({
                on_clicked: () => hyprland.messageAsync(`dispatch workspace ${id}`),
                class_name: activeId.as(i => `${i === id ? "workspace_focused" : "workspace_unfocused"}`),
                cursor: "pointer",
                hpack: "center",
                vpack: "center",
        }))
    )

    return Widget.Box({
        vertical: true,
        class_name: "workspaces",
        hpack: "center",
        vpack: "center",
        children: workspaces,
    })
}
