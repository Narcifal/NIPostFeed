//
//  Router.swift
//  NIPostFeed
//
//  Created by Denys Niestierov on 30.08.2023.
//

import UIKit

protocol RouterMain: AnyObject {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: AssemblyModelBuilderProtocol { get set }
}

protocol RouterProtocol: RouterMain {
    func showPostListModule()
    func showPostDetailsModule(id: Int)
}

final class Router: RouterProtocol {
    
    // MARK: - Properties -
    var assemblyBuilder: AssemblyModelBuilderProtocol
    var navigationController: UINavigationController?
    
    // MARK: - Life Cycle -
    init(assemblyBuilder: AssemblyModelBuilderProtocol,
         navigationController: UINavigationController) {
        self.assemblyBuilder = assemblyBuilder
        self.navigationController = navigationController
    }
    
    // MARK: - Iternal -
    func showPostListModule() {
        let postListModule = assemblyBuilder.createPostListModule(router: self)
        navigationController?.setViewControllers([postListModule], animated: true)
    }
    
    func showPostDetailsModule(id: Int) {
        let postDetailsModule = assemblyBuilder.createPostDetailsModule(router: self, id: id)
        navigationController?.pushViewController(postDetailsModule, animated: true)
    }
    
}
