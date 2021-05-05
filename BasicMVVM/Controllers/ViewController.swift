//
//  ViewController.swift
//  BasicMVVM
//
//  Created by artjoms.vorona on 05/05/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var dataSource: PostsDataSource!
    let cellIdentifier = "Cell"
    
    lazy var viewModel = {
        return PostViewModel(dataSource: dataSource)
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(PostTableViewCell().nib(), forCellReuseIdentifier: PostTableViewCell().cellIdentifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpTableView()
        
        self.viewModel.fetchPostsData()
    }
    
    func setUpTableView() {
        self.view.addSubview(self.tableView)
        self.tableView.frame = self.view.bounds
        
        self.dataSource = PostsDataSource()
        self.tableView.dataSource = dataSource
        
        self.dataSource.data.addObserverAndNotify(self) { [weak self] _ in
            self?.tableView.reloadData()
        }
    }

}

