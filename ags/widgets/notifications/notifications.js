const notifications = await Service.import("notifications")
import GLib from 'gi://GLib';

/** @param {import('resource:///com/github/Aylur/ags/service/notifications.js').Notification} n */
function NotificationIcon({ app_entry, app_icon, image }) {
    if (image) {
        return Widget.Box({
            css: `background-image: url("${image}");`
                + "background-size: contain;"
                + "background-repeat: no-repeat;"
                + "background-position: center;",
        })
    }

    let icon = "notification-symbolic";
    if (Utils.lookUpIcon(app_icon)) {
        icon = app_icon;
        return Widget.Box({
            child: Widget.Icon(icon),
        })
    }
    if (app_entry && Utils.lookUpIcon(app_entry)) {
        icon = app_entry;
        return Widget.Box({
            child: Widget.Icon(icon),
        })
    }

    return Widget.Box({
        class_name: "placeholder_icon"
    })
}

/** @param {import('resource:///com/github/Aylur/ags/service/notifications.js').Notification} n */
export function Notification(n) {
    const icon = Widget.Box({
        vpack: "center",
        hpack: "center",
        class_name: "noti_icon",
        child: NotificationIcon(n),
    })

    const title = Widget.Label({
        class_name: "noti_title",
        xalign: 0,
        justification: "left",
        hexpand: true,
        hpack: "start",
        max_width_chars: 24,
        truncate: "end",
        wrap: true,
        label: n.summary,
        use_markup: true,
    })

    const time = Widget.Label({
        class_name: "noti_time",
        justification: "right",
        hexpand: true,
        hpack: "end",
        max_width_chars: 24,
        truncate: "end",
        wrap: true,
        label: GLib.DateTime.new_from_unix_local(n.time).format('%H:%M'),
        use_markup: true,
    })
    
    const body = Widget.Label({
        class_name: "body",
        hpack: "start",
        hexpand: true,
        use_markup: true,
        xalign: 0,
        justification: "left",
        label: n.body.includes("\n") ? n.body.split("\n",2).map(a => a.length > 35 ? a.substring(0,33).concat("..") : a).join("\n") : n.body.length > 33 ? n.body.substring(0,33).concat("..\n") : n.body.concat("\n"),
        wrap: true,
    })

    const actions = Widget.Box({
        class_name: "actions",
        vpack: "end",
        children: n.actions.map(({ id, label }) => Widget.Button({
            cursor: "pointer",
            class_name: "action-button",
            on_clicked: () => {
                n.invoke(id)
                n.dismiss()
            },
            hexpand: true,
            child: Widget.Label({label: label, class_name: "action_button_text"}),
        })),
    })

    const header = Widget.Box({
        class_name: "noti_header",
        children: [
            title,
            time,
        ]
    })

    return Widget.EventBox({
        attribute: { id: n.id },
        on_primary_click: n.dismiss,
        on_secondary_click: n.close,
        child: Widget.Box({
            class_name: `notification ${n.urgency}`,
            vertical: true,
            child: Widget.Box({
                children: [
                    icon,
                    Widget.Box({ 
                        vertical: true,
                        children: [
                            header,
                            body,
                            actions,
                        ]
                    }),
                ]
            }),
        }),
    })
}

export function NotificationPopups(monitor = 0) {
    //notifications.dnd = true;
    const list = Widget.Box({
        vertical: true,
        children: notifications.popups.map(Notification),
    })

    function onNotified(_, /** @type {number} */ id) {
        const n = notifications.getNotification(id)
        if (n)
            list.children = [Notification(n), ...list.children]
    }

    function onDismissed(_, /** @type {number} */ id) {
        list.children.find(n => n.attribute.id === id)?.destroy()
    }

    list.hook(notifications, onNotified, "notified")
        .hook(notifications, onDismissed, "dismissed")

    return Widget.Window({
        monitor,
        name: `notifications`,
        class_name: "notification-popups",
        anchor: ["top"],
        child: Widget.Box({
            css: "min-width: 2px; min-height: 2px;",
            class_name: "notifications",
            vertical: true,
            children: notifications.bind('popups')
                .as(popups => popups.map(Notification))
        }),
    })
}
