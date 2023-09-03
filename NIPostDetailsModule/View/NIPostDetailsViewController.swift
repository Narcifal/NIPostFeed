//
//  NIPostDetailsViewController.swift
//  NIPostFeed
//
//  Created by Denys Niestierov on 30.08.2023.
//

import UIKit
import Kingfisher

protocol NIPostDetailsViewProtocol: AnyObject {
    func setupViewWithValues(with: NIPostDetail)
}

final class NIPostDetailsViewController: UIViewController {

    static func instantiate(with presenter: NIPostDetailsPresenterProtocol) -> NIPostDetailsViewController {
        let viewController: NIPostDetailsViewController = .instantiate(storyboard: .postDetails)
        viewController.presenter = presenter
        return viewController
    }
    
    // MARK: - Properties -
    var presenter: NIPostDetailsPresenterProtocol!
    
    @IBOutlet weak var postDateLabel: UILabel!
    @IBOutlet weak var postLikesLabel: UILabel!
    @IBOutlet weak var likesImageView: UIImageView!
    @IBOutlet weak var postDescriptionLabel: UILabel!
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    
    // MARK: - Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.getPostDetails()
    }
}

extension NIPostDetailsViewController: NIPostDetailsViewProtocol {
    func setupViewWithValues(with post: NIPostDetail) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            
            let imageUrl = URL(string: post.postImage)
            postImageView.kf.setImage(with: imageUrl)
            postTitleLabel.text = post.title
            postDescriptionLabel.text = post.text
            postLikesLabel.text = String(post.likesCount)
            postDateLabel.text = post.timeshamp.toDateString()
        }
    }
}
