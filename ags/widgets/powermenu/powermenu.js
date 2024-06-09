export function PowerMenu(monitor = 0) {
    const sleep = Widget.Button({
        onClicked: () => App.exec("systemctl suspend"),
        hpack: "center",
        tooltip_text: "Sleep",
        vpack: "center",
        cursor: "pointer",
        class_name: "sleep_button",
        child: Widget.Icon({
            icon: "sleep-symbolic",
            cursor: "pointer",
            class_name: "sleep_icon"
        })
    })

    const reboot = Widget.Button({
        onClicked: () => App.exec("systemctl reboot"),
        hpack: "center",
        tooltip_text: "Reboot",
        vpack: "center",
        cursor: "pointer",
        class_name: "reboot_button",
        child: Widget.Icon({
            icon: "reboot-symbolic",
            cursor: "pointer",
            class_name: "sleep_icon"
        })
    })

    const logout = Widget.Button({
        onClicked: () => App.exec("pkill Hyprland"),
        hpack: "center",
        tooltip_text: "Log Out",
        vpack: "center",
        cursor: "pointer",
        class_name: "logout_button",
        child: Widget.Icon({
            icon: "logout-symbolic",
            cursor: "pointer",
            class_name: "logout_icon"
        })
    })

    const shutdown = Widget.Button({
        onClicked: () => App.exec("shutdown now"),
        hpack: "center",
        tooltip_text: "Shutdown",
        vpack: "center",
        cursor: "pointer",
        class_name: "shutdown_button",
        child: Widget.Icon({
            icon: "power-symbolic",
            cursor: "pointer",
            class_name: "shutdown_icon"
        })
    })

    const lock = Widget.Button({
        onClicked: () => Utils.exec("hyprlock"),
        hpack: "center",
        tooltip_text: "Lock",
        vpack: "center",
        cursor: "pointer",
        class_name: "lock_button",
        child: Widget.Icon({
            icon: "lock-symbolic",
            cursor: "pointer",
            class_name: "lock_icon"
        })
    })

    return Widget.Window({
        name: 'powermenu',
        cursor: "default",
        monitor,
        exclusivity: "normal",
        anchor: ["top"],
        visible: false,
        child: Widget.Box({ 
            class_name: "powermenu",
            children: [
                lock,
                sleep,
                logout,
                reboot,
                shutdown,
            ]
        })
    })

}
