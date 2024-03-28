export function power_button() {
    const icon = Widget.Icon({
        icon: "power-symbolic",
        cursor: "pointer",
        class_name: "power_icon"
    })

    return Widget.Button({
        onClicked: () => print("test"),
        hpack: "center",
        vpack: "center",
        cursor: "pointer",
        child: icon,
        class_name: "power_button",
    })
}

export function notification_button() {
    const icon = Widget.Icon({
        icon: "notification-symbolic",
        hpack: "center",
        vpack: "center",
        cursor: "pointer",
        class_name: "notification_icon"
    })

    return Widget.Button({
        onClicked: () => print("test"),
        hpack: "center",
        vpack: "center",
        cursor: "pointer",
        child: icon,
        class_name: "notification_button",
    })
}


export function misc_button() {
    const icon = Widget.Icon({
        icon: "calendar-symbolic",
        hpack: "center",
        vpack: "center",
        cursor: "pointer",
        class_name: "misc_icon"
    })

    return Widget.Button({
        onClicked: () => print("test"),
        hpack: "center",
        vpack: "center",
        cursor: "pointer",
        child: icon,
        class_name: "misc_button",
    })
}


export function controls_button() {
    const icon = Widget.Icon({
        icon: "slider-symbolic",
        hpack: "center",
        vpack: "center",
        cursor: "pointer",
        class_name: "controls_icon"
    })

    return Widget.Button({
        onClicked: () => print("test"),
        hpack: "center",
        vpack: "center",
        cursor: "pointer",
        child: icon,
        class_name: "controls_button",
    })
}
