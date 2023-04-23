//
//  MainProtocols.swift
//  WidgetTestApp
//
//  Created by Anton Vlezko on 23.04.2023.
//

import UIKit

// MARK: - MainPresenterInput

protocol MainPresenterInput: AnyObject {
    init(
        view: MainViewControllerInput,
        widgetService: WidgetServiceProtocol
    )

    func viewIsReady()
    func didSelectColor(index: Int)
}

// MARK: - MainViewControllerOutput

protocol MainViewControllerInput: AnyObject {
    func setView(with viewModel: MainViewModel)
}
