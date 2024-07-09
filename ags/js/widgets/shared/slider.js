export function Slider(name, icon,tooltip, on_change, setup, value = 0) {
    const slider = Widget.Slider({
        class_name: `${name}_slider`,
        draw_value: false,
        vertical: false,
        vexpand: false,
        hexpand: true,
        inverted: false,
        on_change: on_change,
        setup: setup,
        value: value,
    })

    const slider_icon = Widget.Icon({
        icon: `${icon}-symbolic`,
        cursor: "pointer",
        class_name: `${name}_icon`,
        hexpand: false,
        vexpand: false,
        hpack: "center",
        vpack: "center",
    })

    return Widget.Box({
        hpack: "center",
        vpack: "center",
        hexpand: true,
        tooltip_text: tooltip,
        class_name: name,
        children: [slider_icon, slider],
    })
}
