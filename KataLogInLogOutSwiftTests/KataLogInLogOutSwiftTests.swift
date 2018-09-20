//
//  KataLogInLogOutSwiftTests.swift
//  KataLogInLogOutSwiftTests
//
//  Created by Lara Poveda on 20/9/18.
//  Copyright © 2018 prueba. All rights reserved.
//

import XCTest
@testable import KataLogInLogOutSwift

class KataLogInLogOutSwiftTests: XCTestCase {
    
    var kataUndertest:KataApp!
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        kataUndertest = KataApp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    func testDoesNotLogInWithEmptyUsername(){
        let result = kataUndertest.logIn(username: "", password: "admin")
        XCTAssertEqual(result, false, "Username and password not correct")

    }
    func testDoesLogInWithCorrectUsernameAndPassword(){
        let result = kataUndertest.logIn(username: "admin", password: "admin")
        XCTAssertEqual(result, true, "Username and password not correct")
    }

    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
