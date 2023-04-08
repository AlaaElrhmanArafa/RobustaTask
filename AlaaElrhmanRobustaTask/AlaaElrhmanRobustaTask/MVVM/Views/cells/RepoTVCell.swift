//
//  RepoTVCell.swift
//  AlaaElrhmanRobustaTask
//
//  Created by AlaaElrhman on 08/04/2023.
//

import UIKit

class RepoTVCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var repoAuthorNameLabel: UILabel!
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var repoImageView: UIImageView!
    
    var repoVM: RepoViewModel?{
        didSet{
            dateLabel.text = repoVM?.date
            repoNameLabel.text = repoVM?.repoName
            repoAuthorNameLabel.text = repoVM?.authorName
            if let imageURL = URL(string: repoVM?.avatar ?? ""){
                repoImageView.downloadImage(from: imageURL)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    private func setupUI(){
        repoImageView.layer.cornerRadius = 20
    }
    
}
