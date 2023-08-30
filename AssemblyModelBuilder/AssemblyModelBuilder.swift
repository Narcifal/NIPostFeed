//
//  AssemblyModelBuilder.swift
//  NIPostFeed
//
//  Created by Denys Niestierov on 30.08.2023.
//

import UIKit

protocol AssemblyModelBuilderProtocol: AnyObject {
    func createPostListModule(router: RouterProtocol) -> UIViewController
    func createPostDetailsModule(router: RouterProtocol) -> UIViewController
}

final class AssemblyModelBuilder: AssemblyModelBuilderProtocol {
   
    // MARK: - Iternal -
    func createPostListModule(router: RouterProtocol) -> UIViewController {
        let presenter = NIPostListPresenter(router: router)
        let viewController = NIPostListViewController()
        viewController.presenter = presenter
        presenter.inject(view: viewController)
        return viewController
    }
    
    func createPostDetailsModule(router: RouterProtocol) -> UIViewController {
        let presenter = NIPostListPresenter(router: router)
        let viewController = NIPostListViewController()
        viewController.presenter = presenter
        presenter.inject(view: viewController)
        return viewController
    }
    
}
