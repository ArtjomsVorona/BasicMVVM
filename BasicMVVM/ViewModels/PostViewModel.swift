//
//  PostViewModel.swift
//  BasicMVVM
//
//  Created by artjoms.vorona on 05/05/2021.
//

import Foundation

class PostViewModel {
    weak var dataSource: GenericDataSource<Post>?
    let urlComponents = URLComponents(string: "https://jsonplaceholder.typicode.com/users/1/posts")!
    
    init(dataSource: GenericDataSource<Post>) {
        self.dataSource = dataSource
    }
    
    func fetchPostsData() {
        APIservice().getUserPosts(urlComponents: urlComponents) { (result) in
            switch result {
            case .success(let posts):
                DispatchQueue.main.async {
                    self.dataSource?.data.value = posts
                }
            default:
                break
            }
        }
    }
}
