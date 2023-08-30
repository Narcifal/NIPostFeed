//
//  NIPostListViewController.swift
//  NIPostFeed
//
//  Created by Denys Niestierov on 30.08.2023.
//

import UIKit

protocol NIPostListViewProtocol: AnyObject {
    
}

final class NIPostListViewController: UIViewController {
    
    var presenter: NIPostListPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .brown
    }
    
}

extension NIPostListViewController: NIPostListViewProtocol { }
