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
    
    private struct Constant {
        static let sortImage = "arrow.up.and.down.text.horizontal"
    }
    
    // MARK: - Properties -
    var presenter: NIPostListPresenterProtocol!
    
    // MARK: - UIComponents -
    private var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.bounces = false
        table.translatesAutoresizingMaskIntoConstraints = false
        table.rowHeight = 80
        return table
    }()
    private lazy var sortButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.target = self
        button.action = #selector(sortPostList)
        button.image = UIImage(systemName: Constant.sortImage)
        return button
    }()
    
    // MARK: - Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewController()
        setupTableView()
    }
    
    // MARK: - Iternal -
    
    
}

// MARK: - Private -
private extension NIPostListViewController {
    
    func setupViewController() {
        title = "NIPostFeed"
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = sortButton
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(
            NIPostListTableViewCell.nib(),
            forCellReuseIdentifier: NIPostListTableViewCell.identifier
        )
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    @objc func sortPostList() {
        view.backgroundColor = .darkGray
    }
}

extension NIPostListViewController: NIPostListViewProtocol { }

extension NIPostListViewController: UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

extension NIPostListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NIPostListTableViewCell.identifier) as! NIPostListTableViewCell
        
        //
        
        return cell
    }
}
