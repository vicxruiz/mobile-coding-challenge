//
//  RepositoryController.swift
//  GithubRepo
//
//  Created by Victor  on 6/11/19.
//  Copyright © 2019 Victor . All rights reserved.
//

import Foundation

class RepositoryController {
    
    //passing data
    let dataGetter = DataGetter()
    let baseURL = URL(string: "https://api.github.com/search/repositories?q=created:>2019-05-11&sort=stars&order=desc")!
    var repositories: [Repository] = []
    
    enum HTTPMethod: String {
        case get = "GET"
        case put = "PUT"
        case post = "POST"
        case delete = "DELETE"
    }
    
    func fetch(completion: @escaping (Error?) -> Void) {
        var request = URLRequest(url: baseURL)
        request.httpMethod = HTTPMethod.get.rawValue
        
        dataGetter.fetchData(with: request) { (_, data, error) in
            //error handling
            if let error = error {
                completion(error)
            }
            guard let data = data else { return }
            
            //decoding
            let decoder = JSONDecoder()
            do {
                let root = try decoder.decode(Root.self, from: data)
                self.repositories = root.items
                completion(nil)
            } catch {
                print("error decoding data: \(error)")
                completion(error)
            }
        }
    }
    
    
}
