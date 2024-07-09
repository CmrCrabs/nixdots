const systemtray = await Service.import("systemtray");

function SysButton(icon = 'nixos-symbolic', name = 'nixos', tooltip = 'Button', on_primary_click, on_secondary_click) {
    const icon_widget = Widget.Icon({
        icon: icon,
        cursor: "pointer",
        class_name: `${name}_icon`,
    })

    return Widget.Button({
        on_primary_click: on_primary_click,
        on_secondary_click: on_secondary_click,
        hpack: "center",
        tooltip_markup: tooltip,
        vpack: "center",
        cursor: "pointer",
        class_name: `${name}_button`,
        child: icon_widget,
    })
}

export function SysTray(monitor = 0) {

    const SysTrayItem = item => Widget.Button({
        class_name: "sys_app_button",
        child: Widget.Icon({
            cursor: "pointer",
            class_name: "sys_app_icon",
        }).bind('icon', item, 'icon'),
        tooltipMarkup: item.bind('tooltip_markup'),
        onPrimaryClick: (_, event) => item.activate(event),
        onSecondaryClick: (_, event) => item.openMenu(event),
    });

    const sysTray = Widget.Box({
        children: systemtray.bind('items').as(i => i.map(SysTrayItem)),
        class_name: "systray_box",
    });

    const icon_widget2 = Widget.Icon({
        icon: `nixos-symbolic`,
        cursor: "pointer",
        class_name: `empty_icon`
    })

    const empty = Widget.Button({
        onClicked: () => print("eventually replace with limtless svg"),
        hpack: "center",
        tooltip_text: "System Tray Empty",
        vpack: "center",
        class_name: `empty_button`,
        child: icon_widget2,
    })

    const empty_box = Widget.Box({
        class_name: "systray_box",
        child: empty,
    })

    return Widget.Window({
        name: `systray`,
        monitor,
        anchor: ["bottom", "right"],
        exclusivity: "ignore",
        visible: false,
        child: Widget.Stack({
            children: {
                'items': sysTray,
                'empty': empty_box,
            },
            shown: systemtray.bind('items').as(n => n.length > 0 ? "items" : "empty"),
            //shown: "empty",
            transition: "crossfade",
        })
    })
}
