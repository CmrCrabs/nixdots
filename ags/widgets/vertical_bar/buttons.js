const bluetooth = await Service.import('bluetooth')
const network = await Service.import('network')

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
        onClicked: () => App.toggleWindow("media_center"),
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
        icon: network.bind("connectivity").as(status => status == "full" ? "wifi-enabled-symbolic" : "wifi-warning-symbolic"),
        hpack: "center",
        vpack: "center",
        cursor: "pointer",
        class_name: "wifi_icon"
    })

    const bluetooth_icon = Widget.Icon({
        icon: bluetooth.bind('enabled').as(on => `bluetooth-${on ? 'enabled' : 'disabled'}-symbolic`),
        hpack: "center",
        vpack: "center",
        cursor: "pointer",
        class_name: "bluetooth_icon"
    })

    return Widget.Button({
        onClicked: () => App.toggleWindow("control_center"),
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
