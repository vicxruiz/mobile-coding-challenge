//
//  RepositoryTableViewCell.swift
//  GithubRepo
//
//  Created by Victor  on 6/11/19.
//  Copyright © 2019 Victor . All rights reserved.
//

import Foundation
import UIKit

class RepositoryTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var repoTitleLabel: UILabel!
    @IBOutlet weak var repoDescriptionLabel: UILabel!
    @IBOutlet weak var repoStarCountLable: UILabel!
    
    //Checking for data
    var dataGetter: DataGetter?
    var repository: Repository? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        //unwrap object
        guard let repository = repository else {
            print("no song")
            return
        }
        //setting cell labels to object properties
        repoTitleLabel.text = repository.name
        repoDescriptionLabel.text = repository.description
        repoStarCountLable.text = "\(repository.stargazers_count)"
    }
}
