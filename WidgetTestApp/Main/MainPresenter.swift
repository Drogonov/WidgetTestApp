//
//  MainPresenter.swift
//  WidgetTestApp
//
//  Created by Anton Vlezko on 23.04.2023.
//

import Foundation

class MainPresenter {

    // MARK: - Private Properties

    private weak var view: MainViewControllerInput?
    private var widgetService: WidgetServiceProtocol?

    private var viewModel = MainViewModel()

    // MARK: - Init

    required init(
        view: MainViewControllerInput,
        widgetService: WidgetServiceProtocol
    ) {
        self.view = view
        self.widgetService = widgetService
    }
}

// MARK: - MainPresenterInput

extension MainPresenter: MainPresenterInput {
    func viewIsReady() {
        widgetService?.resetActivities()

        viewModel.title = "Widget Test"
        viewModel.colors = [
            "green",
            "yellow",
            "red"
        ]

        view?.setView(with: viewModel)
    }

    func didSelectColor(index: IndexPath) {
//        let color = viewModel.colors[index.row]
        widgetService?.updateChoosedServer(index)
    }

    func settingsTapped() {
        widgetService?.changeState()
    }
}
