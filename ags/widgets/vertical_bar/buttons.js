export function PowerButton() {
    const icon = Widget.Icon({
        icon: "power-symbolic",
        cursor: "pointer",
        class_name: "power_icon"
    })

    return Widget.Button({
        onClicked: () => App.toggleWindow("powermenu"),
        hpack: "center",
        tooltip_text: "Power Menu",
        vpack: "center",
        cursor: "pointer",
        class_name: "power_button",
        child: icon,
    })
}

export function WallpaperButton() {
    const icon = Widget.Icon({
        icon: "wallpaper-symbolic",
        hpack: "center",
        vpack: "center",
        cursor: "pointer",
        class_name: "wallpaper_icon"
    })

    return Widget.Button({
        onClicked: () => print("test"),
        tooltip_text: "Limitless Theming Menu",
        hpack: "center",
        vpack: "center",
        cursor: "pointer",
        child: icon,
        class_name: "wallpaper_button",
    })
}

export function NotificationButton() {
    const icon = Widget.Icon({
        icon: "notification-symbolic",
        hpack: "center",
        vpack: "center",
        cursor: "pointer",
        class_name: "notification_icon"
    })

    return Widget.Button({
        onClicked: () => App.toggleWindow("notification_tray"),
        tooltip_text: "Notification Menu",
        hpack: "center",
        vpack: "center",
        cursor: "pointer",
        child: icon,
        class_name: "notification_button",
    })
}


export function MiscButton() {
    const icon = Widget.Icon({
        icon: "calendar-symbolic",
        hpack: "center",
        vpack: "center",
        cursor: "pointer",
        class_name: "misc_icon"
    })

    return Widget.Button({
        onClicked: () => print("test"),
        tooltip_text: "Miscellaneous Controls",
        hpack: "center",
        vpack: "center",
        cursor: "pointer",
        child: icon,
        class_name: "misc_button",
    })
}


export function ControlsButton() {
    const icon = Widget.Icon({
        icon: "slider-symbolic",
        hpack: "center",
        vpack: "center",
        cursor: "pointer",
        class_name: "controls_icon"
    })

    return Widget.Button({
        onClicked: () => print("test"),
        tooltip_text: "Controls",
        hpack: "center",
        vpack: "center",
        cursor: "pointer",
        child: icon,
        class_name: "controls_button",
    })
}
