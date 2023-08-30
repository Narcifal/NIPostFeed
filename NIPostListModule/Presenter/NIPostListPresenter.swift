//
//  NIPostListPresenter.swift
//  NIPostFeed
//
//  Created by Denys Niestierov on 30.08.2023.
//

import Foundation

protocol NIPostListPresenterProtocol: AnyObject {
    func showScanResult() 
}

final class NIPostListPresenter: NIPostListPresenterProtocol {
    
    //MARK: - Properties -
    private weak var view: NIPostListViewProtocol?
    private let router: RouterProtocol
    
    //MARK: - Life Cycle -
    required init(router: RouterProtocol) {
        self.router = router
    }

    // MARK: - Iternal -
    func inject(view: NIPostListViewProtocol) {
        self.view = view
    }
    
    func showScanResult() {
        router.showPostDetailsModule()
    }
    
}
