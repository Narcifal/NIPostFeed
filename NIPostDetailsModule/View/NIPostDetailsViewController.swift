//
//  NIPostDetailsViewController.swift
//  NIPostFeed
//
//  Created by Denys Niestierov on 30.08.2023.
//

import UIKit

protocol NIPostDetailsViewProtocol: AnyObject {
    
}

final class NIPostDetailsViewController: UIViewController {

    var presenter: NIPostDetailsPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

}

extension NIPostDetailsViewController: NIPostDetailsViewProtocol {}
