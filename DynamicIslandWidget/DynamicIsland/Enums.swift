//
//  Enums.swift
//  WidgetTestWidgetExtensionExtension
//
//  Created by Anton Vlezko on 23.04.2023.
//

import SwiftUI

enum WidgetState: String {
    case ok
    case warning
    case error

    var message: String {
        switch self {
        case .ok:
            return "Apload Completed"
        case .warning:
            return "Warning smth wrong"
        case .error:
            return "Error pls reload app"
        }
    }

    var messageColor: Color {
        switch self {
        case .ok: return .green
        case .warning: return .yellow
        case .error: return .red
        }
    }
}
