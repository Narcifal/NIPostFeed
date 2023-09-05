//
//  NIPostDetailsPresenter.swift
//  NIPostFeed
//
//  Created by Denys Niestierov on 30.08.2023.
//

import Foundation

protocol NIPostDetailsPresenterProtocol: AnyObject {
    func getPostDetails()
}

final class NIPostDetailsPresenter: NIPostDetailsPresenterProtocol {
    
    //MARK: - Properties -
    private weak var view: NIPostDetailsViewProtocol?
    private let router: RouterProtocol
    private let networkService: NetworkServiceProtocol
    private let postId: Int
    
    //MARK: - Life Cycle -
    required init(router: RouterProtocol, networkService: NetworkServiceProtocol, postId: Int) {
        self.router = router
        self.networkService = networkService
        self.postId = postId
    }
    
    // MARK: - Iternal -
    func inject(view: NIPostDetailsViewProtocol) {
        self.view = view
    }
    
    func getPostDetails() {
        let endPoint = EndPoint.details(id: postId)
        networkService.request(
            endPoint: endPoint,
            type: NIPostDetails.self
        ) { [weak self] result in
            switch result {
            case .success(let result):
                guard let result, let self else {
                    return
                }
                self.view?.setupViewWithValues(with: result.post)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
