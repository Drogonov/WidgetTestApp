//
//  WidgetService.swift
//  WidgetTestApp
//
//  Created by Anton Vlezko on 23.04.2023.
//

import Foundation

// MARK: - WidgetServiceProtocol

protocol WidgetServiceProtocol: AnyObject {
    func updateChoosedServer(_ indexPath: IndexPath)
    func changeState()
    func resetActivities()
}

// MARK: - WidgetServiceProtocol

class WidgetService {

    // MARK: - Properties

    static let shared = WidgetService()

    // MARK: - Private Properties

    private var choosedServer: String
    private var dynamicIslandState = false
    private var splitFlagAndName: (String, String) {
        let flag = String(choosedServer.prefix(1))
        let name = String(choosedServer.dropFirst(2))
        return (flag, name)
    }

    private let dynamicIslandManager = LiveActivityManager()

    private let data = [
        "🇦🇱 Albania", "🇦🇺 Australia", "🇦🇹 Austria", "🇧🇷 Brazil", "🇧🇪 Belgium", "🇧🇬 Bulgaria", "🇨🇦 Canada", "🇨🇳 China", "🇨🇷 Costa Rica", "🇨🇾 Cyprus", "🇨🇿 Czech Republic", "🇩🇰 Denmark", "🇪🇪 Estonia", "🇫🇮 Finland", "🇫🇷 France", "🇬🇪 Georgia", "🇩🇪 Germany", "🇬🇭 Ghana", "🇬🇷 Greece", "🇭🇰 Hong Kong", "🇭🇺 Hungary", "🇮🇸 Iceland", "🇮🇳 India", "🇮🇩 Indonesia", "🇮🇪 Ireland", "🇮🇹 Italy", "🇯🇵 Japan", "🇰🇪 Kenya", "🇱🇻 Latvia", "🇱🇹 Lithuania", "🇱🇺 Luxembourg", "🇲🇾 Malaysia", "🇲🇽 Mexico", "🇲🇩 Moldova", "🇳🇱 Netherlands", "🇳🇿 New Zealand", "🇳🇬 Nigeria", "🇳🇴 Norway", "🇵🇭 Philippines", "🇵🇱 Poland", "🇵🇹 Portugal", "🇷🇴 Romania", "🇷🇺 Russia", "🇷🇸 Serbia", "🇸🇬 Singapore", "🇸🇰 Slovakia", "🇿🇦 South Africa", "🇰🇷 South Korea", "🇪🇸 Spain", "🇸🇪 Sweden", "🇨🇭 Switzerland", "🇹🇼 Taiwan", "🇹🇿 Tanzania", "🇹🇭 Thailand", "🇹🇷 Turkey", "🇺🇦 Ukraine", "🇬🇧 United Kingdom", "🇺🇸 United States", "🇻🇳 Vietnam"
    ]

    // MARK: - Init

    init() {
        choosedServer = self.data[9]
    }
}

// MARK: - WidgetServiceProtocol

extension WidgetService: WidgetServiceProtocol {
    func updateChoosedServer(_ indexPath: IndexPath) {
        self.choosedServer = data[indexPath.row]
        dynamicIslandManager.updateActivity(splitFlagAndName)
    }

    func changeState() {
        self.dynamicIslandState = !dynamicIslandState

        switch dynamicIslandState {
        case true:
            dynamicIslandManager.startActivity(splitFlagAndName)
        case false:
            dynamicIslandManager.stopActivity()
        }
    }

    func resetActivities() {
        dynamicIslandManager.stopActivity()
    }
}
