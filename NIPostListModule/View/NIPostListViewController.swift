//
//  NIPostListViewController.swift
//  NIPostFeed
//
//  Created by Denys Niestierov on 30.08.2023.
//

import UIKit

protocol NIPostListViewProtocol: AnyObject {
    func reloadTable()
}

final class NIPostListViewController: UIViewController {
    
    private struct Constant {
        static let screenTitle = "NIPostFeed"
        static let sortImage = "arrow.up.and.down.text.horizontal"
    }
    
    static func instantiate(with presenter: NIPostListPresenterProtocol) -> NIPostListViewController {
        let viewController: NIPostListViewController = .instantiate(storyboard: .postList)
        viewController.presenter = presenter
        return viewController
    }
    
    // MARK: - Properties -
    var presenter: NIPostListPresenterProtocol!
    
    // MARK: - UIComponents -
    @IBOutlet weak var tableView: UITableView!
    private lazy var rightBarButtonItem: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = UIImage(systemName: Constant.sortImage)
        button.target = self
        button.menu = sortListMenu
        button.tintColor = .black
        return button
    }()
    private var sortListMenu: UIMenu?
    
    // MARK: - Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewController()
        setupTableView()
        presenter.getPostList()
    }
}

extension NIPostListViewController: NIPostListViewProtocol {
    
    func reloadTable() {
        tableView.reloadData()
    }
}

// MARK: - Private -
private extension NIPostListViewController {
    
    func setupViewController() {
        title = Constant.screenTitle
        view.backgroundColor = .white
        sortListMenu = UIMenu(title: "Sort By", children: createSortActions())
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.bounces = false
        tableView.register(
            NIPostListTableViewCell.nib(),
            forCellReuseIdentifier: NIPostListTableViewCell.identifier
        )
    }
    
    func createSortActions() -> [UIAction] {
        let byDateTitle = "Date"
        let byPopularityTitle = "Popularity"
        let byDate = UIAction(title: byDateTitle) { [weak self]_ in
            self?.presenter.sortList(by: SortBy.date)
        }
        let byPopularity = UIAction(title: byPopularityTitle) { [weak self]_ in
            self?.presenter.sortList(by: SortBy.popularity)
        }
        return [byDate, byPopularity]
    }
    
    func updateCellSize() {
        tableView.beginUpdates()
        tableView.endUpdates()
    }
}

extension NIPostListViewController: UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didTapCell(indexPath: indexPath)
    }
}

extension NIPostListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.postCellModelsCount
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NIPostListTableViewCell.identifier) as! NIPostListTableViewCell
        
        DispatchQueue.main.async {
            let post = self.presenter.getPostCellModel(at: indexPath)
            cell.cellModel = post
            cell.configure(update: self.updateCellSize)
        }
        
        return cell
    }
}
