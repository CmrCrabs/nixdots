export function Button(icon = 'nixos', name = 'nixos', tooltip = 'Button', on_click = () => print("real")) {
    const icon_widget = Widget.Icon({
        icon: `${icon}-symbolic`,
        cursor: "pointer",
        class_name: `${name}_icon`
    })

    return Widget.Button({
        onClicked: on_click,
        hpack: "center",
        tooltip_text: tooltip,
        vpack: "center",
        cursor: "pointer",
        class_name: `${name}_button`,
        child: icon_widget,
    })
}
