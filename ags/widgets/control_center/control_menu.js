const notifications = await Service.import("notifications")
const audio = await Service.import("audio")

function ControlButton(icon, header_text, name, label, on_click = () => print("real")) {
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
                hpack: "center",
                vpack: "center",
                children: [
                    DNDButton(),
                    BluetoothButton(),
                ]
            }),
            Widget.Box({
                hpack: "center",
                vpack: "center",
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
        "Wifi",
        "wifi",
        "VM2907828",
    );
}
function DNDButton() {
    return ControlButton(
        "alert",
        "Do Not Disturb",
        "dnd",
        notifications.bind("dnd").transform(a => a ? "On" : "Off"),
        self => {
            notifications.dnd = !notifications.dnd;
            self.toggleClassName("on", notifications.dnd);
        },
    );
}

function BluetoothButton() {
    return ControlButton(
        "bluetooth",
        "Bluetooth",
        "bluetooth",
        "0 Devices Connected",
    );
}

function PowerProfilesButton() {
    return ControlButton(
        "chip",
        "Performance Mode",
        "power_profiles",
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
        onClicked: self => {
            if (Utils.exec('pidof wlsunset').length == 0) {
                Utils.execAsync("wlsunset")
                    .then(out => print(out))
                    .catch(err => print(err));
                self.toggleClassName("on", true);
            } else {
                Utils.execAsync("pkill wlsunset")
                    .then(out => print(out))
                    .catch(err => print(err));
                self.toggleClassName("on", false);
            }
        },
        setup: self => {
            self.toggleClassName("on",!(Utils.exec('pidof wlsunset').length == 0));
        }, 
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
        onClicked: () => {
            audio.speaker.isMuted = !audio.speaker.isMuted
        },
        hpack: "center",
        tooltip_text: "Mute",
        vpack: "center",
        cursor: "pointer",
        class_name: `mute_button`,
        child: icon_widget,
    }).hook(audio, self => {
        self.toggleClassName("on", audio.speaker.isMuted);
    });
}