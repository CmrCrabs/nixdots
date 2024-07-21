const mpris = await Service.import("mpris")
const players = mpris.bind("players")

const FALLBACK_ICON = "nixos-symbolic"
const PLAY_ICON = "play-symbolic"
const PAUSE_ICON = "pause-symbolic"
const PREV_ICON = "fast-backward-symbolic"
const NEXT_ICON = "fast-forward-symbolic"

/** @param {number} length */
function lengthStr(length) {
    const min = Math.floor(length / 60)
    const hours = Math.floor(min / 60)
    const sec = Math.floor(length % 60)
    const sec0 = sec < 10 ? "0" : ""
    if (min > 60) {
        return`${hours}:${min % 60}:${sec0}${sec}`
    }
    return `${min}:${sec0}${sec}`
}

/** @param {import('types/service/mpris').MprisPlayer} player */
function Player(player) {
    const title = Widget.Label({
        class_name: "title",
        wrap: true,
        hpack: "start",
        vpack: "end",
        label: player.bind("track_title").transform(a => a.length > 31 ? a.substring(0,28).concat("...") : a),
    })

    const artist = Widget.Label({
        class_name: "artist",
        wrap: true,
        vpack: "start",
        hpack: "start",
        label: player.bind("track_artists").transform(a => a.join(", ").length > 40 ? a.join(", ").substring(0,37).concat("...") : a.join(", ")),
    })

    const playPause = Widget.Button({
        class_name: "play-pause",
        on_clicked: () => player.playPause(),
        visible: player.bind("can_play"),
        vpack: "center",
        hpack: "center",
        child: Widget.Icon({
            class_name: "play-pause-icon",
            cursor: "pointer",
            vpack: "center",
            icon: player.bind("play_back_status").transform(s => {
                switch (s) {
                    case "Playing": return PAUSE_ICON
                    case "Paused":
                    case "Stopped": return PLAY_ICON
                }
            }),
        }),
    })

    const prev = Widget.Button({
        class_name: "prev",
        on_clicked: () => player.previous(),
        visible: player.bind("can_go_prev"),
        vpack: "center",
        hpack: "center",
        child: Widget.Icon({
            class_name: "prev-icon",
            vpack: "center",
            cursor: "pointer",
            icon: PREV_ICON,
        }),
    })

    const next = Widget.Button({
        class_name: "next",
        vpack: "center",
        hpack: "center",
        on_clicked: () => player.next(),
        visible: player.bind("can_go_next"),
        child: Widget.Icon({
            class_name: "next-icon",
            cursor: "pointer",
            icon: NEXT_ICON,
        }),
    })

    const positionSlider = Widget.Slider({
        class_name: "position-slider",
        draw_value: false,
        on_change: ({ value }) => player.position = value * player.length,
        visible: player.bind("length").as(l => l > 0),
        setup: self => {
            function update() {
                const value = player.position / player.length
                self.value = value > 0 ? value : 0
            }
            self.hook(player, update)
            self.hook(player, update, "position")
            self.poll(1000, update)
        },
    })

    const positionLabel = Widget.Label({
        class_name: "position",
        hpack: "start",
        setup: self => {
            const update = (_, time) => {
                self.label = lengthStr(time || player.position)
                self.visible = player.length > 0
            }
            self.hook(player, update, "position")
            self.poll(1000, update)
        },
    })

    const lengthLabel = Widget.Label({
        class_name: "length",
        hpack: "end",
        visible: player.bind("length").transform(l => l > 0),
        label: player.bind("length").transform(lengthStr),
    })

    const icon = Widget.Icon({
        class_name: "app_icon",
        hexpand: true,
        hpack: "end",
        vpack: "start",
        tooltip_text: player.identity || "",
        icon: player.bind("entry").transform(entry => {
            const name = `${entry}-symbolic`
            return Utils.lookUpIcon(name) ? name : FALLBACK_ICON
        }),
    })

    const music_box = Widget.CenterBox({
        class_name: "player",
        css: player.bind("cover_path").transform(p => `
            background-image: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('${p}');
        `),
        vertical: true,
        start_widget: Widget.Box({
            vertical: true,
            children: [
                title,
                artist,
            ]
        }),
        end_widget: Widget.CenterBox({
            vertical: true,
            hexpand: true,
            vexpand: true,
            center_widget: positionSlider,
            end_widget: Widget.CenterBox({
                class_name: "time_box",
                start_widget: positionLabel,
                end_widget: lengthLabel,
            })
        }),
    })

    const controls_box = Widget.CenterBox({
        class_name: "player_controls",
        vertical: true,
        start_widget: prev,
        center_widget: playPause,
        end_widget: next,
    })

    return Widget.Box({
        children: [
            music_box,
            controls_box,
        ]
    })
}

export function Media() {
    return Widget.Box({
        vertical: true,
        hpack: "center",
        vpack: "center",
        class_name: "media",
        visible: players.as(p => p.length > 0),
        children: players.as(p => p.map(Player).slice(0,2)),
    })
}
