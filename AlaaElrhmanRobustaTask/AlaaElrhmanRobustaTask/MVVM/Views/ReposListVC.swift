//
//  ReposListVC.swift
//  AlaaElrhmanRobustaTask
//
//  Created by AlaaElrhman on 08/04/2023.
//

import UIKit

class ReposListVC: UIViewController {
    //MARK: - outlets and variables
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var reposTableView: UITableView!
    
    let viewModel = ReposListViewModel(apiService: Service())
    
    //MARK: - viewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
        setpUI()
        bindViewModel()
    }
    
    private func registerNibs(){
        reposTableView.registerNibForTable(ofType: RepoTVCell.self)
    }
    
    private func setpUI(){
        self.title = "Repositories List"
        self.navigationController?.navigationBar.backgroundColor = .systemMint
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    //MARK: - bind to viewModel
    private func bindViewModel(){
        viewModel.reloadTableClosure = { [weak self] () in
            DispatchQueue.main.async {
                self?.reposTableView.reloadData()
            }
        }
        
        viewModel.showAlertClosure = { [weak self] msg in
            DispatchQueue.main.async {
                self?.showOKAlert(message: msg)
            }
        }
        
        viewModel.didChangeLoadingClosure = { [weak self] status in
            DispatchQueue.main.async {
                switch status{
                case .loading:
                    self?.activityIndicator.startAnimating()
                    self?.activityIndicator.isHidden = false
                case .stoppedLoadding:
                    self?.activityIndicator.stopAnimating()
                    self?.activityIndicator.isHidden = true
                }
            }
        }
        
        viewModel.fetchReposList()
    }
}
//MARK: - tableView delegates
extension ReposListVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCellForTable(ofType: RepoTVCell.self)
        cell.repoVM = viewModel.getRepoViewModel(at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let repoVM = viewModel.getRepoViewModel(at: indexPath)
        let vc = RepoDetailsVC(viewModel: repoVM)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
// MARK: - search bar delegate
extension ReposListVC: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.viewModel.search(with: searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
        self.viewModel.clearSearch()
    }
}
