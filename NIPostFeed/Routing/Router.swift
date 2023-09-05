//
//  Router.swift
//  NIPostFeed
//
//  Created by Denys Niestierov on 30.08.2023.
//

import UIKit

protocol RouterProtocol {
    func showPostListModule()
    func showPostDetailsModule(id: Int)
}

final class Router: RouterProtocol {
    
    // MARK: - Properties -
    private var builder: BuilderProtocol
    private var navigationController: UINavigationController?
    
    // MARK: - Life Cycle -
    init(builder: BuilderProtocol,
         navigationController: UINavigationController) {
        self.builder = builder
        self.navigationController = navigationController
    }
    
    // MARK: - Iternal -
    func showPostListModule() {
        let postListModule = builder.createPostListModule(router: self)
        navigationController?.setViewControllers([postListModule], animated: true)
    }
    
    func showPostDetailsModule(id: Int) {
        let postDetailsModule = builder.createPostDetailsModule(router: self, id: id)
        navigationController?.pushViewController(postDetailsModule, animated: true)
    }
    
}
