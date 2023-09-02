//
//  NIPostDetailsPresenter.swift
//  NIPostFeed
//
//  Created by Denys Niestierov on 30.08.2023.
//

import Foundation

protocol NIPostDetailsPresenterProtocol: AnyObject { }

final class NIPostDetailsPresenter: NIPostDetailsPresenterProtocol {
    
    //MARK: - Properties -
    private weak var view: NIPostDetailsViewProtocol?
    private let router: RouterProtocol
    private var networkService: NetworkServiceProtocol
    private let postId: Int
    
    //MARK: - Life Cycle -
    required init(router: RouterProtocol, networkService: NetworkServiceProtocol = NetworkService.shared, postId: Int) {
        self.router = router
        self.networkService = networkService
        self.postId = postId
    }

    // MARK: - Iternal -
    func inject(view: NIPostDetailsViewProtocol) {
        self.view = view
    }
    
}

private extension NIPostDetailsPresenter { }
