export function NotificationMusicButton() {
    const noti_icon = Widget.Icon({
        icon: "notification-symbolic",
        hpack: "center",
        vpack: "center",
        cursor: "pointer",
        class_name: "notification_icon"
    })

    const music_icon = Widget.Icon({
        icon: "music-symbolic",
        hpack: "center",
        vpack: "center",
        cursor: "pointer",
        class_name: "music_icon"
    })
    return Widget.Button({
        onClicked: () => App.toggleWindow("notification_tray"),
        tooltip_text: "Notification Menu",
        hpack: "center",
        vpack: "center",
        cursor: "pointer",
        child: Widget.Box({
            vertical: true,
            children: [
                noti_icon,
                music_icon,
            ]
        }),
        class_name: "notification_music_button",
    })
}

export function MiscButton() {
    const slider_icon = Widget.Icon({
        icon: "slider-symbolic",
        hpack: "center",
        vpack: "center",
        cursor: "pointer",
        class_name: "slider_icon"
    })

    const wifi_icon = Widget.Icon({
        icon: "wifi-symbolic",
        hpack: "center",
        vpack: "center",
        cursor: "pointer",
        class_name: "wifi_icon"
    })

    const bluetooth_icon = Widget.Icon({
        icon: "bluetooth-symbolic",
        hpack: "center",
        vpack: "center",
        cursor: "pointer",
        class_name: "bluetooth_icon"
    })

    return Widget.Button({
        onClicked: () => print("test"),
        tooltip_text: "Miscellaneous Controls",
        hpack: "center",
        vpack: "center",
        cursor: "pointer",
        child: Widget.Box({
            vertical: true,
            children: [
                slider_icon,
                wifi_icon,
                bluetooth_icon,
            ]
        }),
        class_name: "misc_button",
    })
}
