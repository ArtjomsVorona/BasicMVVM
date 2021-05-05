//
//  APIserviceTests.swift
//  BasicMVVMTests
//
//  Created by artjoms.vorona on 05/05/2021.
//

import XCTest
@testable import BasicMVVM

class APIserviceTests: XCTestCase {
    
    var apisService: APIservice!

    override func setUpWithError() throws {
        self.apisService = APIservice()
    }

    override func tearDownWithError() throws {
        self.apisService = nil
    }
    
    func testParseResponse() throws {
        //given
        guard let data = FileManager.readJSON(forResource: "sample") else {
            XCTAssert(false, "sample.json is not available")
            return
        }
        
        //when
        let posts = try apisService.parseResponse(data: data)
        
        //then
        XCTAssertNotNil(posts, "ParseResponse should not be nil")
    }
    
    func testParrseResponseIsNil() throws {
        //given
        guard let data = FileManager.readJSON(forResource: "brokensample") else {
            XCTAssert(false, "brokensample.json is not available")
            return
        }
        
        //when
        let posts = try apisService.parseResponse(data: data)
        
        //then
        XCTAssertNil(posts, "ParseResponse should be nil")
        
    }
    
    func testGetUserPostsIsSuccess() {
        //given
        let expectation = XCTestExpectation(description: "Download Posts is success")
        let urlComponents = URLComponents(string: "https://jsonplaceholder.typicode.com/users/1/posts")!
        
        //when
        apisService.getUserPosts(urlComponents: urlComponents) { (result) in
            switch result {
            case .failure(_):
                XCTAssert(false, "Posts download should be success")
            default:
                break
                
            }
            expectation.fulfill()
        }
        
        //then
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testGetUserPostsIsFailure() {
        //given
        let expectation = XCTestExpectation(description: "Download Posts is failure")
        let brokenUrlComponents = URLComponents(string: "https://jsonpldfer.typicode.ds")!
        
        //when
        apisService.getUserPosts(urlComponents: brokenUrlComponents) { (result) in
            switch result {
            case .success(_):
                XCTAssert(false, "Posts download should be failure")
            default:
                break
            }
            expectation.fulfill()
        }
        
        //then
        wait(for: [expectation], timeout: 5.0)
    }

}
