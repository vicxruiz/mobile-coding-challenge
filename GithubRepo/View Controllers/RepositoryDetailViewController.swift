//
//  RepositoryDetailViewController.swift
//  GithubRepo
//
//  Created by Victor  on 6/11/19.
//  Copyright © 2019 Victor . All rights reserved.
//

import Foundation
import UIKit
import WebKit
class RepositoryDetailViewController: UIViewController, WKUIDelegate {
    var repositoryController: RepositoryController?
    var repository: Repository? {
        return repositoryController?.repository
    }
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let repository = repository else {
            print("No repository")
            return
        }
        
        self.title = repository.name

        let repoURL = repository.website
        
        let myURL = URL(string: "\(repoURL)")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
    }
}
