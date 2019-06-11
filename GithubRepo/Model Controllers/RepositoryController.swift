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
    let baseURL = URL(string: "https://api.github.com")!
    var repositories: [Repository] = []
    
    enum HTTPMethod: String {
        case get = "GET"
        case put = "PUT"
        case post = "POST"
        case delete = "DELETE"
    }
    
    func fetch(completion: @escaping (Error?) -> Void) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.github.com"
        components.path = "/search/repositories"
        
        let queryItemQuery = URLQueryItem(name: "q", value: "created:>2017-10-22")
        let querySortItemQuery = URLQueryItem(name: "sort", value: "stars")
        let queryOrderItemQuery = URLQueryItem(name: "order", value: "desc")
        components.queryItems = [queryItemQuery, querySortItemQuery, queryOrderItemQuery]
        print(components.url ?? "no url")
        var request = URLRequest(url: components.url!)
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
                let data = try decoder.decode(Items.self, from: data)
                self.repositories = data.items
                completion(nil)
            } catch {
                print("error decoding data: \(error)")
                completion(error)
            }
        }
    }
    
    
}
