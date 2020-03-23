//
//  ListViewModelTest.swift
//  GBMETests
//
//  Created by Jithin James on 3/22/20.
//  Copyright © 2020 Jithin James. All rights reserved.
//

import XCTest
@testable import GBME

class ListViewModelTest: XCTestCase {
    var viewModel : ImageListViewModel?
    
    override func setUp() {
        viewModel = ImageListViewModel(socialService: ServiceLayer(type: .pixaBay))
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testForData(){
        
        let expectation = self.expectation(description: "geting")
        viewModel?.imageService.getListImages(complete: {data in
            XCTAssertTrue(data.count > 0)
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 10.0)

    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
