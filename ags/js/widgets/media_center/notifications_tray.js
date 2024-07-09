import Notifications from 'resource:///com/github/Aylur/ags/service/notifications.js';
import { Notification } from './notifications.js';
import { timeout } from 'resource:///com/github/Aylur/ags/utils.js';

const ClearButton = () => Widget.Button({
    class_name: "clear_button",
    hpack: "end",
    vpack: "center",
    tooltip_text: "Clear All",
    cursor: "pointer",
    child: Widget.Icon({
        class_name: "clear_icon",
        icon: "trash-symbolic",
    }),
    on_clicked: () => {
        const list = Array.from(Notifications.notifications);
        for (let i = 0; i < list.length; i++)
            timeout(50 * i, () => list[i]?.close());
    },
    sensitive: Notifications.bind('notifications').transform(n => n.length > 0),
});

const Header = () => Widget.CenterBox({
    class_name: 'notifications_header',
    start_widget: Widget.Label({ label: 'Notifications', xalign: 0}),
    end_widget: ClearButton(),
});

const NotificationList = () => Widget.Box({
    vertical: true,
    vexpand: true,
    vpack: "start",
    hpack: "center",
    class_name: "notifications_list",
    children: Notifications.bind('notifications').transform(n => n.reverse().map(Notification)),
    //visible: Notifications.bind('notifications').transform(n => n.length > 0),
    visible: true,
});

const Placeholder = () => Widget.Box({
    class_name: 'placeholder',
    vertical: true,
    vpack: 'center',
    hpack: 'center',
    vexpand: true,
    hexpand: true,
    //visible: Notifications.bind('notifications').transform(n => n.length === 0),
    visible: true,
    children: [
        Widget.Icon({icon: "nixos-symbolic",}),
        Widget.Label('Your inbox is empty'),
    ],
});

export function NotificationCenter(monitor = 0) {
    return  Widget.Box({
        class_name: 'notifications_tray',
        vertical: true,
        children: [
            Header(),
            Widget.Scrollable({
                class_name: 'notification-scrollable',
                child: Widget.Box({
                    class_name: 'notification-list',
                    child: Widget.Stack({
                        children: {
                            'list': NotificationList(),
                            'placeholder': Placeholder(),
                        },
                        shown: Notifications.bind('notifications').transform(n => n.length > 0 ? "list" : "placeholder"),
                        transition: "crossfade",
                    })
                }),
            }),
        ],
    })
}
