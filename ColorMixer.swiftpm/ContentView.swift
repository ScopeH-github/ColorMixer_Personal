import SwiftUI

struct MixerView: View {
    @State var redValue: Double = 0
    @State var greenValue: Double = 0
    @State var blueValue: Double = 0
    var body: some View {
        VStack{
            ColorView(red: $redValue, green: $greenValue, blue: $blueValue)
                .frame(maxWidth: 300, maxHeight: 120)
                .padding()
            ColorSlider(value: $redValue, color: .red)
                .padding(.horizontal)
            ColorSlider(value: $greenValue, color: .green)
                .padding(.horizontal)
            ColorSlider(value: $blueValue, color: .blue)
                .padding(.horizontal)
            Text("Slide slider / Input value(0~255) \ninto text field, and mix your color.\n\nTap button to copy hex code into clipboard.")
                .font(.caption)
                .foregroundColor(.secondary)
                .padding()
                .padding(.top, 120)
        }
    }
}


struct ColorView: View {
    @Binding var red: Double
    @Binding var green: Double
    @Binding var blue: Double
    var body: some View {
        Button(action: {
            UIPasteboard.general.string = "#\(getHexTriplet(red, green, blue))"
        }) {
            Text("#\(getHexTriplet(red, green, blue))")
                .foregroundColor(textColorInvert())
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.init(red: red, green: green, blue: blue))
                .cornerRadius(10)
                .font(.custom("Menlo", size: 25))
                .monospacedDigit()
        }
        .accentColor(.white)
    }
    
    func textColorInvert() -> Color {
        let lightGreen = green > 0.7
        let lightPink = !lightGreen && red > 0.8 && blue > 0.6
        if lightGreen || lightPink {
            return Color.black
        } else {
            return Color.white
        }
    }
}

struct ColorSlider: View {
    @Binding var value: Double
    @State var color: Color
    var body: some View {
        ZStack {
            Slider(value: $value, in: 0...1)
                .accentColor(.clear)
                .background(
                    ZStack {
                        Color.black.opacity(1-value)
                        color.opacity(value)
                    }
                )
                .cornerRadius(100)
                .overlay(
                    RoundedRectangle(cornerRadius: 100)
                            .stroke(.tertiary, lineWidth: 1.5)
                )
                .padding()
        }
    }
}
