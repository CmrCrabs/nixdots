const audio = await Service.import("audio")
import brightness from '../misc/brightness.js';

export function ControlSliders() {
    return Widget.CenterBox({
        hpack: "center",
        vpack: "center",
        hexpand: true,
        vexpand: true,
        class_name: "control_sliders",
        spacing: 8,
        start_widget: volume_slider(),
        center_widget: brightness_slider(),
        end_widget: microphone_slider(),
    })
}

function volume_slider() {
    const volumeSlider = Widget.Slider({
        class_name: "volume_slider",
        draw_value: false,
        vertical: true,
        vexpand: false,
        hexpand: false,
        inverted: true,
        on_change: ({ value }) => audio.speaker.volume = value,
        setup: self => self.hook(audio.speaker, () => {
            self.value = audio.speaker.volume || 0
        }),
    })

    const volumeIcon = Widget.Icon({
        icon: "speaker-symbolic",
        cursor: "pointer",
        class_name: "speaker_icon",
        hexpand: false,
        vexpand: false,
        hpack: "center",
        vpack: "center",
    })

    return Widget.Box({
        hpack: "center",
        vpack: "center",
        class_name: "volume",
        vertical: true,
        children: [volumeSlider, volumeIcon],
    })
}

function brightness_slider() {
    const brightnessSlider = Widget.Slider({
        class_name: "brightness_slider",
        draw_value: false,
        vertical: true,
        vexpand: false,
        hexpand: false,
        inverted: true,
        on_change: ({ value }) => brightness.screen_value = value,
        value: brightness.bind("screen-value"),
    })

    const brightnessIcon = Widget.Icon({
        icon: "sun-symbolic",
        cursor: "pointer",
        class_name: "brightness_icon",
        hexpand: false,
        vexpand: false,
        hpack: "center",
        vpack: "center",
    })

    return Widget.Box({
        hpack: "center",
        vpack: "center",
        class_name: "brightness",
        vertical: true,
        children: [brightnessSlider, brightnessIcon],
    })
}

function microphone_slider() {
    const microphoneSlider = Widget.Slider({
        class_name: "microphone_slider",
        draw_value: false,
        vertical: true,
        vexpand: false,
        hexpand: false,
        inverted: true,
        on_change: ({ value }) => audio.microphone.volume = value,
        setup: self => self.hook(audio.microphone, () => {
            self.value = audio.microphone.volume || 0
        }),
    })

    const microphoneIcon = Widget.Icon({
        icon: "microphone-symbolic",
        cursor: "pointer",
        class_name: "microphone_icon",
        hexpand: false,
        vexpand: false,
        hpack: "center",
        vpack: "center",
    })

    return Widget.Box({
        hpack: "center",
        vpack: "center",
        class_name: "microphone",
        vertical: true,
        children: [microphoneSlider, microphoneIcon],
    })
}
