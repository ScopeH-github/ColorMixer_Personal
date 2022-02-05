import SwiftUI

struct ContentView: View {
    var body: some View {
        ColorView()
            .frame(maxWidth: 200, maxHeight: 120)
    }
}


struct ColorView: View {
    var body: some View {
        Button(action: {}) {
            Text("#123456")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.red)
                .cornerRadius(10)
                .font(.custom("Menlo", size: 25))
                .monospacedDigit()
        }
        .accentColor(.white)
    }
}
