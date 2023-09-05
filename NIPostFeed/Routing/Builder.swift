//
//  AssemblyModelBuilder.swift
//  NIPostFeed
//
//  Created by Denys Niestierov on 30.08.2023.
//

import UIKit

protocol BuilderProtocol {
    func createPostListModule(router: RouterProtocol) -> UIViewController
    func createPostDetailsModule(router: RouterProtocol, id: Int) -> UIViewController
}

final class Builder: BuilderProtocol {
   
    // MARK: - Properties -
    var networkService = NetworkService()
    
    // MARK: - Iternal -
    func createPostListModule(router: RouterProtocol) -> UIViewController {
        let presenter = NIPostListPresenter(router: router, networkService: networkService)
        let viewController = NIPostListViewController.instantiate(with: presenter)
        presenter.inject(view: viewController)
        return viewController
    }
    
    func createPostDetailsModule(router: RouterProtocol, id: Int) -> UIViewController {
        let presenter = NIPostDetailsPresenter(router: router, networkService: networkService, postId: id)
        let viewController = NIPostDetailsViewController.instantiate(with: presenter)
        presenter.inject(view: viewController)
        return viewController
    }
    
}
