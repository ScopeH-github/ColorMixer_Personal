import SwiftUI
import Foundation

public func getHexTriplet(_ red: Double, _ green: Double, _ blue: Double) -> String {
    String(format: "%02X", Int(red * 255)) + String(format: "%02X", Int(green * 255)) + String(format: "%02X", Int(blue * 255))
}
