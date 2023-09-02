//
//  NIPostDetailsViewController.swift
//  NIPostFeed
//
//  Created by Denys Niestierov on 30.08.2023.
//

import UIKit
import Kingfisher

protocol NIPostDetailsViewProtocol: AnyObject { }

final class NIPostDetailsViewController: UIViewController {

    // MARK: - Properties -
    var presenter: NIPostDetailsPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension NIPostDetailsViewController: NIPostDetailsViewProtocol { }
