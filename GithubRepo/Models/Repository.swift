//
//  Repository.swift
//  GithubRepo
//
//  Created by Victor  on 6/11/19.
//  Copyright © 2019 Victor . All rights reserved.
//

import Foundation

struct Items: Codable {
    let items: [Repository]
    private enum CodingKeys: String, CodingKey {
        case items
    }
}

struct Repository: Codable {
    let name: String
    let owner: Details
    let description: String?
    let stars: Int
    private enum CodingKeys: String, CodingKey {
        case stars = "stargazers_count"
        case name
        case description
        case owner
    }
}

struct Details: Codable {
    let login: String
    let avatar_url: String
}



