//
//  ReposListViewModel.swift
//  AlaaElrhmanRobustaTask
//
//  Created by AlaaElrhman on 08/04/2023.
//

import Foundation

enum ViewState{
    case loading
    case stoppedLoadding
}

class ReposListViewModel {
    
    let apiService: APIServiceProtocol
    
    //MARK: - Variables
    private var repos = [GitReposResponseElement]()
    private var cellViewModels: [RepoViewModel] = [RepoViewModel]() {
        didSet {
            self.reloadTableClosure?()
        }
    }
    
    var count: Int{
        return cellViewModels.count
    }
    
    var viewState: ViewState = .stoppedLoadding{
        didSet{
            didChangeLoadingClosure?(viewState)
        }
    }
    
    //MARK: - closure
    var reloadTableClosure: (() -> ())?
    var showAlertClosure: ((_ msg: String) -> ())?
    var didChangeLoadingClosure: ((_ status: ViewState) -> ())?
    
    //MARK: - init
    init(apiService: APIServiceProtocol) {
        self.apiService = apiService
    }
    
    //MARK: - Helper functions
    func getRepoViewModel(at indexPath: IndexPath) -> RepoViewModel{
        return cellViewModels[indexPath.row]
    }
    
    
    
    //MARK: - FetchData
    func fetchReposList(){
        viewState = .loading
        apiService.fetchRepos { [weak self] success, repos, errorMessage in
            self?.viewState = .stoppedLoadding
            if let errorMessage = errorMessage{
                self?.showAlertClosure?(errorMessage)
                return
            }
            if success{
                self?.repos.append(contentsOf: repos)
                self?.cellViewModels = self?.repos.map({return RepoViewModel(repo: $0)}) ?? []
            }
        }
    }
}
