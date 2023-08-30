//
//  NIPostDetailsPresenter.swift
//  NIPostFeed
//
//  Created by Denys Niestierov on 30.08.2023.
//

import Foundation

protocol NIPostDetailsPresenterProtocol: AnyObject {

}

final class NIPostDetailsPresenter: NIPostDetailsPresenterProtocol {
    
    //MARK: - Properties -
    private weak var view: NIPostDetailsViewProtocol?
    private let router: RouterProtocol
    
    //MARK: - Life Cycle -
    required init(router: RouterProtocol) {
        self.router = router
    }

    // MARK: - Iternal -
    func inject(view: NIPostDetailsViewProtocol) {
        self.view = view
    }
}

