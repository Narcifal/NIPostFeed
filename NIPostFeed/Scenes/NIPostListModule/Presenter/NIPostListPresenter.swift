//
//  NIPostListPresenter.swift
//  NIPostFeed
//
//  Created by Denys Niestierov on 30.08.2023.
//

import Foundation

protocol NIPostListPresenterProtocol: AnyObject {
    var postCellModelsCount: Int { get }
    func didTapCell(indexPath: IndexPath)
    func getPostCellModel(at indexPath: IndexPath) -> NIPost
    func getPostList()
    func sortList(by value: SortBy)
}

final class NIPostListPresenter: NIPostListPresenterProtocol {
    
    //MARK: - Properties -
    private weak var view: NIPostListViewProtocol?
    private let router: RouterProtocol
    private let networkService: NetworkServiceProtocol
    var postCellModels = [NIPost]()
    var postCellModelsCount: Int {
        get {
            postCellModels.count
        }
    }
    
    //MARK: - Life Cycle -
    required init(router: RouterProtocol, networkService: NetworkServiceProtocol) {
        self.router = router
        self.networkService = networkService
    }
    
    // MARK: - Iternal -
    func inject(view: NIPostListViewProtocol) {
        self.view = view
    }
    
    func didTapCell(indexPath: IndexPath) {
        let postId = postCellModels[indexPath.row].postId
        router.showPostDetailsModule(id: postId)
    }
    
    func getPostList() {
        let endPoint = EndPoint.list
        networkService.request(
            endPoint: endPoint,
            type: NIPostList.self
        ) { [weak self] result in
            switch result {
            case .success(let result):
                guard let result, let self else {
                    return
                }
                self.fetchResult(result)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func sortList(by value: SortBy) {
        switch value {
        case .date:
            postCellModels.sort(by: { $0.timeshamp > $1.timeshamp })
        case .popularity:
            postCellModels.sort(by: { $0.likesCount > $1.likesCount })
        }
        view?.reloadTable()
    }
    
    func getPostCellModel(at indexPath: IndexPath) -> NIPost {
        return postCellModels[indexPath.row]
    }
}

private extension NIPostListPresenter {
    
    func fetchResult(_ result: NIPostList) {
        result.posts.forEach { post in
            let cell = createCellModel(post: post)
            postCellModels.append(cell)
        }
        view?.reloadTable()
    }
    
    func createCellModel(post: NIPost) -> NIPost {
        let cell = NIPost(
            postId: post.postId,
            timeshamp: post.timeshamp,
            title: post.title,
            previewText: post.previewText,
            likesCount: post.likesCount
        )
        return cell
    }
}

enum SortBy: String {
    case date = "Date"
    case popularity = "Popularity"
}
