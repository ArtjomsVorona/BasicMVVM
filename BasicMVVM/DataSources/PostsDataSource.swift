//
//  PostsDataSource.swift
//  BasicMVVM
//
//  Created by artjoms.vorona on 05/05/2021.
//

import UIKit

class PostsDataSource: GenericDataSource<Post>, UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell().cellIdentifier, for: indexPath) as? PostTableViewCell else { return UITableViewCell()}
        
        let item = self.data.value[indexPath.row]
        cell.title?.text = item.title
        cell.body.text = item.body
        
        return cell
    }
}
