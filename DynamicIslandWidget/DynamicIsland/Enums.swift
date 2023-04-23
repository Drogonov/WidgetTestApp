//
//  Enums.swift
//  WidgetTestWidgetExtensionExtension
//
//  Created by Anton Vlezko on 23.04.2023.
//

import SwiftUI

enum ColorMessage: String {
    case ok
    case warning
    case error

    var messageColor: Color? {
        switch self {
        case .ok: return .green
        case .warning: return .yellow
        case .error: return .red
        }
    }
}
