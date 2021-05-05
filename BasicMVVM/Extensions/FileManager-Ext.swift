//
//  FileManager-Ext.swift
//  BasicMVVM
//
//  Created by artjoms.vorona on 05/05/2021.
//

import Foundation

extension FileManager {
    static func readJSON(forResource fileName: String) -> Data? {
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return data
            } catch {
                print("FileManager readJSON error: ", error)
            }
        }
        
        return nil
    }
}
