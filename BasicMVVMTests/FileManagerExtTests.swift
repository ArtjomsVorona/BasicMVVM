//
//  FileManagerExtTests.swift
//  BasicMVVMTests
//
//  Created by artjoms.vorona on 05/05/2021.
//

import XCTest
@testable import BasicMVVM

class FileManagerExtTests: XCTestCase {

    func testReadJSON() {
        //given
        let fileName = "sample"
        
        //when
        let data = FileManager.readJSON(forResource: fileName)
        
        //then
        XCTAssertNotNil(data, "Should read sample.json file")
    }
}
