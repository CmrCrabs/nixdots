const { query } = await Service.import("applications")
const WINDOW_NAME = "start_menu"

const hidden_apps = [
    "",
]

const AppItem = app => Widget.Button({
    on_clicked: () => {
        App.closeWindow(WINDOW_NAME)
        app.launch()
    },
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
    // list of application buttons
    let applications = query("").map(AppItem)

    // container holding the buttons
    const list = Widget.Box({
        vertical: true,
        children: applications,
        spacing: 30,
    })

    // repopulate the box, so the most frequent apps are on top of the list
    function repopulate() {
        applications = query("").map(AppItem)
        list.children = applications
    }

    // search entry
    const entry = Widget.Entry({
        hexpand: true,
        class_name: "search_bar",
        placeholder_text: "Search...",

        // to launch the first item on Enter
        on_accept: () => {
            // make sure we only consider visible (searched for) applications
	    const results = applications.filter((item) => item.visible);
            if (results[0]) {
                App.toggleWindow(WINDOW_NAME)
                results[0].attribute.app.launch()
            }
        },

        // filter out the list
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
            }),
        ],
        setup: self => self.hook(App, (_, windowName, visible) => {
            if (windowName !== WINDOW_NAME)
                return

            // when the applauncher shows up
            if (visible) {
                repopulate()
                entry.text = ""
                entry.grab_focus()
            }
        }),
    })
}

// there needs to be only one instance
export function AppLauncher() {
    return Widget.Box({
        setup: self => self.keybind("Escape", () => {
            App.closeWindow(WINDOW_NAME)
        }),
        visible: false,
        child: Applauncher(),
    })
}

