function ControlButton(icon, name, header_text, label = "epic", on_click = () => print("real")) {
    const icon_widget = Widget.Icon({
        hpack: "center",
        vpack: "center",
        icon: `${icon}-symbolic`,
        cursor: "pointer",
        class_name: `control_button_icon`
    })

    const header = Widget.Label({
        class_name: `control_button_header`,
        hpack: "start",
        vpack: "end",
        label: header_text,
    })

    const actual_label = Widget.Label({
        class_name: `control_button_label`,
        vpack: "start",
        hpack: "start",
        label: label,
    })

    return Widget.Button({
        onClicked: on_click,
        hpack: "center",
        vpack: "center",
        cursor: "pointer",
        class_name: `${name}_button`,
        child: Widget.Box({
            hpack: "start",
            vpack: "center",
            children: [
                icon_widget,
                Widget.Box({
                    vertical: true,
                    children: [
                        header,
                        actual_label,
                    ]
                })
            ]
        }),
    })
}

export function ControlMenu() {
    return Widget.Box({
        hpack: "center",
        vpack: "center",
        hexpand: true,
        vexpand: true,
        vertical: true,
        class_name: "control_menu",
        children: [
            WifiButton(),
            Widget.Box({
                children: [
                    DNDButton(),
                    BluetoothButton(),
                ]
            }),
            Widget.Box({
                children: [
                    PowerProfilesButton(),
                    RedShiftButton(),
                    MuteButton(),
                ]
            })
        ]
    })
}

function WifiButton() {
    return ControlButton(
        "wifi",
        "wifi",
        "Wifi",
        "VM2907828",
    );
}
function DNDButton() {
    return ControlButton(
        "alert",
        "dnd",
        "Do Not Disturb",
        "Off",
    );
}

function BluetoothButton() {
    return ControlButton(
        "bluetooth",
        "bluetooth",
        "Bluetooth",
        "0 Devices Connected",
    );
}

function PowerProfilesButton() {
    return ControlButton(
        "chip",
        "power_profiles",
        "Performance Mode",
        "On",
    );
}

function RedShiftButton() {
    const icon_widget = Widget.Icon({
        icon: `bulb-symbolic`,
        cursor: "pointer",
        class_name: `redshift_icon`
    })

    return Widget.Button({
        onClicked: () => print("test"),
        hpack: "center",
        tooltip_text: "Night Light",
        vpack: "center",
        cursor: "pointer",
        class_name: `redshift_button`,
        child: icon_widget,
    })
}

function MuteButton() {
    const icon_widget = Widget.Icon({
        icon: `silent-symbolic`,
        cursor: "pointer",
        class_name: `mute_icon`
    })

    return Widget.Button({
        onClicked: () => print("test"),
        hpack: "center",
        tooltip_text: "Mute",
        vpack: "center",
        cursor: "pointer",
        class_name: `mute_button`,
        child: icon_widget,
    })
}
