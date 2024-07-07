import Hyprland from 'resource:///com/github/Aylur/ags/service/hyprland.js';
import Applications from 'resource:///com/github/Aylur/ags/service/applications.js';
import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import App from 'resource:///com/github/Aylur/ags/app.js';
import { Button } from '../shared/button.js';

const pinned_apps_list = [
        'firefox',
        'kitty',
        'spotify',
        'discord',
        'krita',
        'blender',
];

function range(length, start = 1) {
    return Array.from({ length }, (_, i) => i + start);
}
function launchApp(app) {
    Utils.execAsync(['hyprctl', 'dispatch', 'exec', `sh -c ${app.executable}`]);
    app.frequency += 1;
}

const AppButton = ({ icon, pinned = false, count = 0, ...rest }) => {
    const indicators = Widget.Box({
        vpack: 'end',
        hpack: 'center',
        children: range(5, 0).map(() => Widget.Box({
            class_name: 'indicator',
            visible: false,
        })),
    });

    return Widget.Button({
        ...rest,
        attribute: indicators,
        child: Widget.Box({
            class_name: 'taskbar_icon_box',
            child: Widget.Overlay({
                child: Widget.Icon({
                    icon,
                    size: 50,
                }),
                pass_through: true,
                overlays: pinned ? [indicators] : [],
            }),
        }),
    });
};

const pinned_apps = () => Widget.Box({
    class_name: 'pins',
    homogeneous: true,
    children: pinned_apps_list .map(term => ({ app: Applications.query(term)?.[0], term }))
        .filter(({ app }) => app)
        .map(({ app, term }) => AppButton({
            pinned: true,
            icon: app.icon_name || '',
            on_primary_click: () => {
                for (const client of Hyprland.clients) {
                    if (client.class.toLowerCase().includes(term))
                        return focus(client);
                }

                launchApp(app);
            },
            on_middle_click: () => launchApp(app),
            tooltip_text: app.name,
            setup: button => button.hook(Hyprland, () => {
                const running = Hyprland.clients
                    .filter(client => client.class.toLowerCase().includes(term));

                const focused = running.find(client =>
                    client.address === Hyprland.active.client.address);

                const index = running.findIndex(c => c === focused);

                for (let i = 0; i < 5; ++i) {
                    const indicator = button.attribute.children[i];
                    indicator.visible = i < running.length;
                    indicator.toggleClassName('focused', i === index);
                }

                button.set_tooltip_text(running.length === 1 ? running[0].class : app.name);
            }),
        })),
});


const focus = ({ address }) => Hyprland.message(`dispatch focuswindow address:${address}`);
const taskbar = () => Widget.Box({
    children: Hyprland.bind('clients').transform(c => c.map(client => {
        for (const app of Applications.list) {
            for (const pin of pinned_apps_list) {
                if (client.class.toLowerCase().includes(pin.toLowerCase())) return null; 
            }
           
            if ((
                client.title && app.match(client.title) ||
                client.class && app.match(client.class)
                )) {
                return AppButton({
                    icon: app.icon_name || '',
                    tooltip_text: app.name,
                    on_primary_click: () => focus(client),
                    on_middle_click: () => launchApp(app),
                });
            }
        }
    })),
});

const seperator = () => Widget.Separator({
    vertical: true,
    class_name: "separator",
})

function start_menu_button() {
    return Button("launcher", "start_menu", "Start Menu", () => { App.toggleWindow("start_menu"); });
}

function systray_button() {
    return Button("chevron-right", "systray", "System tray", () => App.toggleWindow("systray"));
}
export function Dock(monitor = 0) {
    return Widget.Window({
        name: 'dock',
        cursor: "default",
        layer: "top",
        monitor,
        exclusivity: "exclusive",
        anchor: ["bottom"],
        class_name: "dock_window",
        child: Widget.CenterBox({
            class_name: 'dock',
            vertical: false,
            start_widget: Widget.Box({
                class_name: "icons",
                children: [
                    pinned_apps(),
                    seperator(),
                    taskbar(),
                ],
            }),
            center_widget: Widget.Box({}),
            end_widget: Widget.Box({
                hpack: "end",
                vpack: "center",
                children: [
                    seperator(),
                    start_menu_button(),
                    systray_button(),
                ],
            }),
        }),
    })
}

