const { query } = await Service.import("applications")
const WINDOW_NAME = "start_menu"

const hidden_apps = [
    "neovim wrapper",
    "hdajackretask",
    "echomixer",
    "ranger",
    "hdspconf",
    "rofi theme selector",
    "nixos manual",
    "envy24 control",
    "helix",
    "fish",
    "hdspmixer",
    "btop++",
    "rofi",
    "gparted",
    "yazi",
]

const AppItem = app => Widget.Button({
    on_clicked: () => {
        App.closeWindow(WINDOW_NAME)
        app.launch()
    },
    class_name: "app_item_button",
    attribute: { app },
    child: Widget.Box({
        class_name: "app_item_box",
        children: [
            Widget.Icon({
                icon: app.icon_name || "",
                size: 50,
                class_name: "list_icon",
            }),
            Widget.Label({
                class_name: "title",
                label: app.name,
                xalign: 0,
                vpack: "center",
                truncate: "end",
            }),
        ],
    }),
})

const Applauncher = () => {
    let applications = query("").filter(a => {
        let hidden = false;
        for (const app of hidden_apps) { 
            if (app == a.name.toLowerCase()) { hidden = true; }
        }
        return !hidden;
    }).map(AppItem);

    const list = Widget.Box({
        vertical: true,
        children: applications,
        spacing: 30,
    })

    function repopulate() {
        applications = query("") .filter(a => {
            let hidden = false;
            for (const app of hidden_apps) { 
                if (app == a.name.toLowerCase()) { hidden = true; }
            }
            return !hidden;
        }).map(AppItem)
        list.children = applications
    }

    const entry = Widget.Entry({
        hexpand: true,
        class_name: "search_bar",
        placeholder_text: "Search...",

        on_accept: ({ text }) => {
            const results = applications.filter((item) => item.visible);
            if (results[0]) {
                App.toggleWindow(WINDOW_NAME)
                results[0].attribute.app.launch()
            } else {
                App.toggleWindow(WINDOW_NAME)
                Utils.execAsync(['bash', '-c', text])
                    .then(out => print(out))
                    .catch(err => print(err));
            }
        },

        on_change: ({ text }) => applications.forEach(item => {
            item.visible = item.attribute.app.match(text ?? "")
        }),
    })

    return Widget.Box({
        vertical: true,
        class_name: "app_launcher",
        children: [
            entry,
            Widget.Scrollable({
                hscroll: "never",
                class_name: "scrollable",
                child: list,
                vexpand: true,
            }),
        ],
        setup: self => self.hook(App, (_, windowName, visible) => {
            if (windowName !== WINDOW_NAME)
                return

            if (visible) {
                repopulate()
                entry.text = ""
                entry.grab_focus()
            }
        }),
    })
}

export function AppLauncher() {
    return Widget.Box({
        setup: self => self.keybind("Escape", () => {
            App.closeWindow(WINDOW_NAME)
        }),
        visible: false,
        child: Applauncher(),
    })
}

