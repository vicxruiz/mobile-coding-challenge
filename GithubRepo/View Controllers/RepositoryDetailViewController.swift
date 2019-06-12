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
    var repository: Repository?
    
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myURL = URL(string: "")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
}
