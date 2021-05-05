//
//  GenericDataSource.swift
//  BasicMVVM
//
//  Created by artjoms.vorona on 05/05/2021.
//

import Foundation

class GenericDataSource<T>: NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
}
