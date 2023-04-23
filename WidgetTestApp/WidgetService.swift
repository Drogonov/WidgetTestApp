//
//  WidgetService.swift
//  WidgetTestApp
//
//  Created by Anton Vlezko on 23.04.2023.
//

import Foundation

// MARK: - WidgetServiceProtocol

protocol WidgetServiceProtocol: AnyObject {
    func updateChoosedState(_ state: String)
    func changeState(_ state: Bool)
    func resetActivities()
}

// MARK: - WidgetServiceProtocol

class WidgetService {

    // MARK: - Properties

    static let shared = WidgetService()

    // MARK: - Private Properties

    private let dynamicIslandManager = LiveActivityManager()

    private var choosedState: String
    private var dynamicIslandState = false

    // MARK: - Init

    init() {
        choosedState = "error"
    }
}

// MARK: - WidgetServiceProtocol

extension WidgetService: WidgetServiceProtocol {
    func updateChoosedState(_ state: String) {
        self.choosedState = state
        dynamicIslandManager.updateActivity(choosedState)
    }

    func changeState(_ state: Bool) {
        self.dynamicIslandState = state

        switch dynamicIslandState {
        case true:
            dynamicIslandManager.startActivity(choosedState)
        case false:
            dynamicIslandManager.stopActivity()
        }
    }

    func resetActivities() {
        self.dynamicIslandState = false
        dynamicIslandManager.stopActivity()
    }
}
