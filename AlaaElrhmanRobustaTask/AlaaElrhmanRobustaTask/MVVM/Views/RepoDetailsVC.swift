//
//  RepoDetailsVC.swift
//  AlaaElrhmanRobustaTask
//
//  Created by AlaaElrhman on 08/04/2023.
//

import UIKit

class RepoDetailsVC: UIViewController {
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var authorImageView: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var repoViewModel: RepoViewModel!
    
    init(viewModel: RepoViewModel){
        self.repoViewModel = viewModel
        super.init(nibName: "RepoDetailsVC", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setRepoInfo()
    }
    
    private func setupUI(){
        self.title = "Details"
        self.authorImageView.layer.cornerRadius = 20
    }
    
    private func setRepoInfo(){
        typeLabel.text = repoViewModel.accountType
        descriptionTextView.text = repoViewModel.desc
        authorNameLabel.text = repoViewModel.authorName
        repoNameLabel.text = repoViewModel.repoName
        dateLabel.text = repoViewModel.date
        
        if let imageURL = URL(string: repoViewModel.avatar){
            authorImageView.downloadImage(from: imageURL)
        }
    }
}
