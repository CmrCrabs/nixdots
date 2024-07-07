import { Button } from '../shared/button.js';

export function PowerMenu(monitor = 0) {
    const sleep = Button(
        "sleep",
        "sleep",
        "Sleep",
        () => Utils.exec("systemctl suspend"),
    );

    const reboot = Button(
        "reboot",
        "reboot",
        "Reboot",
        () => Utils.exec("systemctl reboot"),
    );

    const logout = Button(
        "logout",
        "logout",
        "Log Out",
        () => Utils.exec("pkill hyprland"),
    );

    const shutdown = Button(
        "power",
        "shutdown",
        "Shutdown",
        () => Utils.exec("shutdown now"),
    );

    const lock = Button(
        "lock",
        "lock",
        "Lock",
        () => Utils.exec("hyprlock"),
    );
    const icon_widget = Widget.Icon({
        icon: `nixos-symbolic`,
        cursor: "pointer",
        class_name: `limitless_icon`
    })

    const limitless = Widget.Button({
        onClicked: () => print("eventually replace with limtless svg"),
        hpack: "center",
        tooltip_text: "Limitless",
        vpack: "start",
        cursor: "pointer",
        class_name: `limitless_button`,
        child: icon_widget,
    })

    return Widget.Box({
        cursor: "default",
        child: Widget.CenterBox({ 
            class_name: "powermenu",
            vertical: true,
            vpack: "start",
            hpack: "center",
            start_widget: limitless,
            end_widget: Widget.Box({
                vpack: "end",
                hpack: "center",
                vertical: true,
                children: [
                    lock,
                    sleep,
                    logout,
                    reboot,
                    shutdown,
                ],
            }),
        })
    })

}
