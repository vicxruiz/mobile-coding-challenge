//
//  Repository.swift
//  GithubRepo
//
//  Created by Victor  on 6/11/19.
//  Copyright © 2019 Victor . All rights reserved.
//

import Foundation

struct Root: Codable {
    let items: [Repository]
}
struct Repository: Codable {
    let name: String
    let description: String
    let stargazers_count: Int
    let owner: [Details]
}
struct Details: Codable {
    let login: String
    let avatar_url: String
}



