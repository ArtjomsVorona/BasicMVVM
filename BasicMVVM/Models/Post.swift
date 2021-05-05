//
//  Post.swift
//  BasicMVVM
//
//  Created by artjoms.vorona on 05/05/2021.
//

import Foundation

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String?
    let body: String?
}
