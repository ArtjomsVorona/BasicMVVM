//
//  PostsDataSourceTests.swift
//  BasicMVVMTests
//
//  Created by artjoms.vorona on 05/05/2021.
//

import XCTest
@testable import BasicMVVM

class PostsDataSourceTests: XCTestCase {
    
    var dataSource: PostsDataSource!
    
    override func setUpWithError() throws {
        dataSource = PostsDataSource()
    }

    override func tearDownWithError() throws {
        dataSource = nil
    }

    func testEmptyValueInDataSource() {
        //given
        self.dataSource.data.value = []
        
        //when
        let tableView = UITableView()
        tableView.dataSource = dataSource
        
        //then
        XCTAssertEqual(dataSource.numberOfSections(in: tableView), 1, "Number of sections should be 1")
        
        XCTAssertEqual(dataSource.tableView(tableView, numberOfRowsInSection: 0), 0, "Number of rows should be zero")
        
    }
    
    func testValueInDataSource() {
        //given
        let firstPost = Post(userId: 1, id: 1, title: "First post", body: "First Body")
        let secondPost = Post(userId: 1, id: 1, title: "First post", body: "First Body")
        self.dataSource.data.value = [firstPost, secondPost]
        
        //when
        let tableView = UITableView()
        tableView.dataSource = dataSource
        
        //then
        XCTAssertEqual(dataSource.tableView(tableView, numberOfRowsInSection: 0), 2, "Number of rows should be two")
    }
    
    func testValueCell() {
        //given
        let firstPost = Post(userId: 1, id: 1, title: "First post", body: "First Body")
        let secondPost = Post(userId: 1, id: 1, title: "First post", body: "First Body")
        self.dataSource.data.value = [firstPost, secondPost]
        
        //when
        let tableView = UITableView()
        tableView.dataSource = dataSource
        tableView.register(PostTableViewCell().nib(), forCellReuseIdentifier: PostTableViewCell().cellIdentifier)
        
        let indexPath = IndexPath(row: 0, section: 0)
        
        //then
        guard let _ = dataSource.tableView(tableView, cellForRowAt: indexPath) as? PostTableViewCell else {
            XCTAssert(false, "Expected PostTableViewCell")
            return
        }
    }

}
