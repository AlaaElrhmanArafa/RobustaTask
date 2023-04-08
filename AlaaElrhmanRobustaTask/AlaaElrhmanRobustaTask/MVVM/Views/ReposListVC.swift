//
//  ReposListVC.swift
//  AlaaElrhmanRobustaTask
//
//  Created by AlaaElrhman on 08/04/2023.
//

import UIKit

class ReposListVC: UIViewController {
    
    @IBOutlet weak var reposTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
        setpUI()
    }
    
    private func registerNibs(){
        reposTableView.registerNibForTable(ofType: RepoTVCell.self)
    }
    
    private func setpUI(){
        self.title = "Repositories List"
        self.navigationController?.navigationBar.backgroundColor = .systemMint
    }


}
//MARK: - tableView delegates
extension ReposListVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCellForTable(ofType: RepoTVCell.self)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = RepoDetailsVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
