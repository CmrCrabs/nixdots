import { Slider } from '../shared/slider.js';

const cached_json = JSON.parse(Utils.readFile(`${App.configDir}/options.json`));

export function ThemeSliders() {
    return Widget.Box({
        hpack: "center",
        vpack: "center",
        vertical: true,
        vpack: "center",
        hpack: "center",
        class_name: "theming_sliders",
        children: [
            rounding(),
        ]
    })
}

function rounding() {
    return Slider(
        "rounding", // class name
        "rounding", // icon name
        "Global Rounding", // tooltip
        ({ value }) => {
            print(value);
            cached_json.rounding = value;
        }, //on change
        self => self.value = cached_json.rounding, //setup
        30,
        0, //min
        50, //max
    )
}
