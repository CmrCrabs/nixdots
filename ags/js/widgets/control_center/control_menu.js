const notifications = await Service.import("notifications");
const audio = await Service.import("audio");
const powerprofiles = await Service.import("powerprofiles");
const bluetooth = await Service.import('bluetooth');
const network = await Service.import('network')

function ControlButton(icon, header_text, name, label, on_click = () => print("real"), setup = () => {}) {
    const icon_widget = Widget.Icon({
        hpack: "center",
        vpack: "center",
        icon: icon,
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
        setup: setup,
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
function DNDButton() {
    return ControlButton(
        "alert-symbolic",
        "Do Not Disturb",
        "dnd",
        notifications.bind("dnd").transform(a => a ? "On" : "Off"),
        self => {
            notifications.dnd = !notifications.dnd;
            self.toggleClassName("on", notifications.dnd);
        },
    );
}

function WifiButton() {
    return ControlButton(
        network.bind("connectivity").as(status => status == "full" ? "wifi-enabled-symbolic" : "wifi-warning-symbolic"),
        "Wifi",
        "wifi",
        network.bind("connectivity").as(status => status == "full" ? network.wifi.ssid : network.wifi.enabled ? "Disconnected" : "Disabled"),
        self => {
            network.toggleWifi();
            self.toggleClassName("on", !network.wifi.enabled);
        },
        self => self.toggleClassName("on", network.wifi.enabled),
    );
}

function BluetoothButton() {
    return ControlButton(
        bluetooth.bind("enabled").as(on => on ? "bluetooth-enabled-symbolic" : "bluetooth-disabled-symbolic"),
        "Bluetooth",
        "bluetooth",
        bluetooth.bind("enabled").as(on => !on ? "Disabled" : bluetooth.devices.length == 1 ? "1 Device Connected" : `${bluetooth.devices.length.toString()} Devices Connected`),
        self => { 
            bluetooth.enabled = !bluetooth.enabled
            self.toggleClassName("on", !bluetooth.enabled);
        },
        self => {
            self.toggleClassName("on", bluetooth.enabled);
        }
    );
}

function PowerProfilesButton() {
    return ControlButton(
        "chip-symbolic",
        "Power Mode",
        "power_profiles",
        powerprofiles.bind('active_profile').transform(a => a.charAt(0).toUpperCase() + a.slice(1)),
        self => {
            switch (powerprofiles.active_profile) {
                case 'balanced':
                    powerprofiles.active_profile = 'performance';
                    self.toggleClassName("bal", false);
                    self.toggleClassName("perf", true);
                    break;
                case 'performance':
                    powerprofiles.active_profile = 'power-saver';
                    self.toggleClassName("perf", false);
                    break;
                default:
                    powerprofiles.active_profile = 'balanced';
                    self.toggleClassName("bal", true);
                    break;
            };
        },
        self => {
            switch (powerprofiles.active_profile) {
                case 'balanced':
                    self.toggleClassName("bal", true);
                    self.toggleClassName("perf", false);
                    break;
                case 'performance':
                    self.toggleClassName("perf", true);
                    self.toggleClassName("bal", false);
                    break;
            };
        }
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
                Utils.execAsync("wlsunset -l 52.2 -L 0.13")
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
