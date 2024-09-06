const bluetooth = await Service.import('bluetooth')
const network = await Service.import('network')
const mpris = await Service.import("mpris")
const notifications = await Service.import("notifications")

export function NotificationMusicButton() {
    const noti_icon = Widget.Icon({
        icon: "notification-symbolic",
        hpack: "center",
        vpack: "center",
        cursor: "pointer",
        class_name: "notification_icon"
    })

    const noti_indicator = Widget.Overlay({
        child: noti_icon,
        overlays: [
            Widget.Box({
                child: Widget.Label({
                    class_name: "badge",
                    label: notifications.bind("notifications").transform(a => a.length > 0 ? a.length.toString() : "")
                })
            })
        ]
    })

    const music_icon = Widget.Icon({
        icon: mpris.bind("players").as(p => p.length > 0 ? "media-enabled-symbolic" : "media-disabled-symbolic"),
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
                noti_indicator,
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
