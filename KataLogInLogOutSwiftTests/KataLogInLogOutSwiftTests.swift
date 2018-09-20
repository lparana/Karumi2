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
    private let clock = ClockMock()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        kataUndertest = KataApp(clock)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    func testDoesNotLogInWithEmptyUsername(){
        XCTAssertEqual(kataUndertest.logIn(username: "", password: "admin"), false, "Username and password not correct")

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
    func testDoesNotLogInWithInvalidUsername(){
        XCTAssertEqual(kataUndertest.validateUsername(username: "lara;"), true, "Username not correct")
    }
    
    func testReturnSuccessIfTheUsernameIsCorrect(){
        XCTAssertEqual(kataUndertest.validateUsername(username: "Admin"), false, "Username not correct")

    }
    
    func testReturnSuccessIfTheSecondWhenLogOutIsPerformedIsEven(){
        givenNowIs(Date(timeIntervalSince1970: 2))
        let result = kataUndertest.logOut()
        XCTAssertEqual(result, true, "Second not even")
    }
    
    func testReturnFailIfTheSecondWhenLogOutIsPerformedIsOdd(){
        givenNowIs(Date(timeIntervalSince1970: 1))
        let result = kataUndertest.logOut()
        XCTAssertEqual(result, false, "Second not odd")
    }
    
    private func givenNowIs(_ date : Date){
        clock.mockedNow = date
    }
}

class ClockMock: Clock {
    var mockedNow: Date = Date()
    override var now:Date {
        return mockedNow
    }
}
