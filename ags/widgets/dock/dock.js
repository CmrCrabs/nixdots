import Hyprland from 'resource:///com/github/Aylur/ags/service/hyprland.js';
import Applications from 'resource:///com/github/Aylur/ags/service/applications.js';
import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import App from 'resource:///com/github/Aylur/ags/app.js';
const systemtray = await Service.import("systemtray")

const pinned_apps_list = [
        'firefox',
        'kitty',
        'spotify',
        'discord',
        'blender',
        'Neovim wrapper'
];

function start_menu_button() {
   const icon = Widget.Icon({
        icon: "launcher-symbolic",
        cursor: "pointer",
        class_name: "start_menu_icon"
    })

    return Widget.Button({
        onClicked: () => App.toggleWindow("start_menu"),
        tooltip_text: "Start Menu",
        hpack: "center",
        vpack: "center",
        cursor: "pointer",
        child: icon,
        class_name: "start_menu_button",
    })
}

function systray_button() {
   const icon = Widget.Icon({
        icon: "chevron-right-symbolic",
        cursor: "pointer",
        class_name: "systray_icon"
    })

    return Widget.Button({
        onClicked: () => App.toggleWindow("systray"),
        tooltip_text: "System Tray",
        hpack: "center",
        vpack: "center",
        cursor: "pointer",
        child: icon,
        class_name: "systray_button",
    })
}

export function SysTray(monitor = 0) {
    const items = systemtray.bind("items")
        .as(items => items.map(item => Widget.Button({
        class_name: "sys_app_btn",
        child: Widget.Icon({ icon: item.bind("icon"), class_name: "sys_app_icon", size: 30, }),
            on_primary_click: (_, event) => {
                App.closeWindow("systray")
                item.activate(event).catch()
            },
            on_secondary_click: (_, event) => item.openMenu(event).catch(),
            tooltip_markup: item.bind("tooltip_markup"),
        })))
    const itembox = Widget.Box({
        class_name: "systray_box",
        children: items,
    })

    return Widget.Window({
        name: `systray`,
        monitor,
        anchor: ["right"],
        exclusivity: "normal",
        visible: false,
        child: itembox,
    })
}


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

export function Dock(monitor = 0) {

    for (const app in Applications.List) {
        console.log(app);
    }

    return Widget.Window({
        name: 'dock',
        cursor: "default",
        monitor,
        exclusivity: "exclusive",
        anchor: ["bottom"],
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

