import { Slider } from '../shared/slider.js';
const audio = await Service.import("audio")
import brightness from '../misc/brightness.js';

export function ControlSlider() {
    return Widget.Box({
        hpack: "center",
        vpack: "center",
        hexpand: true,
        vertical: true,
        vpack: "center",
        hpack: "center",
        class_name: "control_sliders",
        children: [
            volume_slider(),
            brightness_slider(),
            microphone_slider(),
        ]
    })
}

function volume_slider() {
    return Slider(
        "volume", 
        "speaker", 
        "Volume Control",
        ({ value }) => audio.speaker.volume = value,
        self => self.hook(audio.speaker, () => {
            self.value = audio.speaker.volume || 0
        }),
    )
}

function microphone_slider() {
    return Slider(
        "microphone", 
        "microphone", 
        "Microphone Control",
        ({ value }) => audio.microphone.volume = value,
        self => self.hook(audio.microphone, () => {
            self.value = audio.microphone.volume || 0
        }),
    )
}

function brightness_slider() {
    return Slider(
        "brightness", 
        "sun", 
        "Brightness Control",
        ({ value }) => brightness.screen_value = value,
        () => {},
        brightness.bind("screen-value"),
    )
}
