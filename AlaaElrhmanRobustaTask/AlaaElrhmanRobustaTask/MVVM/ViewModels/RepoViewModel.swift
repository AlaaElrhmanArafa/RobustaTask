//
//  RepoViewModel.swift
//  AlaaElrhmanRobustaTask
//
//  Created by AlaaElrhman on 08/04/2023.
//

import Foundation

struct RepoViewModel{
    let authorName: String
    let avatar: String
    let date: String
    let accountType: String
    let desc: String
    let repoName: String
    
    init(repo: GitReposResponseElement){
        authorName = repo.owner?.login ?? ""
        avatar = repo.owner?.avatarURL ?? ""
        accountType = repo.owner?.type?.rawValue ?? ""
        desc = repo.description ?? ""
        repoName = repo.name ?? ""
        date = ""
//        date = getDateFormat(from:) // no date available in API response
    }
    
//    private func getDateFormat(from date: String) -> String {
//
//    }
}
