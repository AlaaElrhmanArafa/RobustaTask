//
//  RepoMocModel.swift
//  AlaaElrhmanRobustaTaskTests
//
//  Created by AlaaElrhman on 08/04/2023.
//

import Foundation

struct RepoMocModel{
    let date: String?
    let desc: String?
    let repoName: String?
    let owner: OwnerMoc?
}

struct OwnerMoc{
    let authorName: String?
    let avatar: String?
    let accountType: String?
}

struct MocRepoViewModel{
    let authorName: String
    let avatar: String
    let date: String
    let accountType: String
    let desc: String
    let repoName: String
    
    init(repo: RepoMocModel){
        authorName = repo.owner?.authorName ?? ""
        avatar = repo.owner?.avatar ?? ""
        accountType = repo.owner?.accountType ?? ""
        desc = repo.desc ?? ""
        repoName = repo.repoName ?? ""
        date = ""
    }
}


var mocRepos = [RepoMocModel(date: "", desc: "Test first Desc", repoName: "Test firstName", owner: OwnerMoc(authorName: "Owner name", avatar: "", accountType: "User")),
                RepoMocModel(date: "", desc: "Test second Desc", repoName: "Test SecondName", owner: OwnerMoc(authorName: "Owner name econd", avatar: "", accountType: "Oragnization"))]

