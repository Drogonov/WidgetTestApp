//
//  WidgetService.swift
//  WidgetTestApp
//
//  Created by Anton Vlezko on 23.04.2023.
//

import Foundation

// MARK: - WidgetServiceProtocol

protocol WidgetServiceProtocol: AnyObject {
    func didChangeDynamicIsland(with color: String)
}

// MARK: - WidgetService

class WidgetService {

}

// MARK: - WidgetServiceProtocol

extension WidgetService: WidgetServiceProtocol {
    func didChangeDynamicIsland(with color: String) {
        debugPrint(color)
    }
}
