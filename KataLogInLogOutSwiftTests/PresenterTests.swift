//
//  PresenterTests.swift
//  PresenterTests
//
//  Created by Lara Poveda on 20/9/18.
//  Copyright © 2018 prueba. All rights reserved.
//

import XCTest
@testable import KataLogInLogOutSwift

class PresenterTests: XCTestCase {
    
    private var kata:MockKataApp!
    private var view:MockView!
    private var presenter: Presenter!
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.kata = MockKataApp()
        self.view = MockView()
        self.presenter = Presenter(kata:kata,view: view)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    //Los 3 csos de mensajes con log in
    
    func testshowLogInWhenTappedLogOut(){
        givenLogOutProcessReturns(true)
        
        presenter.didTapLogOutButton()
        XCTAssertTrue(view.didhideLogOutForm, "Error logging out")
        XCTAssertTrue(view.didshowLogInForm, "Error logging out")
    }
    
    func testNotshowLogInWhenTappedLogOut(){
        givenLogOutProcessReturns(false)
        
        presenter.didTapLogOutButton()
        XCTAssertFalse(view.didhideLogOutForm, "Error logging out")
        XCTAssertFalse(view.didshowLogInForm, "Error logging out")
    }
    
    func testSuccessWhenTappinLogIn(){
        givenLogInProcessReturns(true)
        givenValidProcessReturns(false)//No contiene caracteres extraños
        //let promise = expectation(description: "Status code: 200")
        
        presenter.didTapLogInButton(username: "admin", password: "admin")
        
        XCTAssertTrue(view.didshowLogOutForm, "Did not show log out")
        XCTAssertTrue(view.didhideLogInForm, "Did hide Log out")
        
        //Con la librería nimble  .toEventually  y que las funciones devuelven Future<> el valor es síncrono pero se utilizan de form aasñincrona
        
        //waitForExpectations(timeout: 5, handler: nil)
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    private func givenLogInProcessReturns(_ result: Bool){
        kata.mockedLogInResult = result
    }
    
    private func givenValidProcessReturns(_ result: Bool){
        kata.mockedValidusernameResult = result
    }
    
    private func givenLogOutProcessReturns(_ result: Bool){
        kata.mockedLogOutResult = result
    }
}



class MockView:View {
    
    var errorMessageShown:String?
    var didshowLogInForm:Bool = false
    var didhideLogInForm:Bool = false
    var didshowLogOutForm:Bool = false
    var didhideLogOutForm:Bool = false
    
    func showError(_ message: String) {
        errorMessageShown = message
    }
    
    func showLogInForm() {
        didshowLogInForm = true
    }
    
    func hideLogInForm() {
        didhideLogInForm = true
    }
    
    func showLogOutForm() {
        didshowLogOutForm = true
    }
    
    func hideLogOutForm() {
        didhideLogOutForm = true
    }
}

class MockKataApp:KataApp {
    var mockedValidusernameResult:  Bool!
    var mockedLogInResult:  Bool!
    var mockedLogOutResult: Bool!
    
    init(){
        super.init(Clock())
    }
    
    override func validateUsername(username: String) -> Bool {
        return mockedValidusernameResult
    }
    
    override func logIn(username: String, password: String) -> Bool {
        return mockedLogInResult
    }
    
    override func logOut() -> Bool {
        return mockedLogOutResult
    }
}



//Los test Fake Respetan la instancia a la que remplazan
//Código que para nuestro presenter es asíncrono pero para el test es síncrono
//SyncAway que se basa en una ecorutina para Android

//AsynControlle = Async{código aquí}

/*
//ALTERNATIVA Creamos uan clase
class ExecutionHandler(){
 lambda
 func run(block:(Unit -> Unit)){
 new Handler(new Looper()){
 Thread(Runnable()){
    block()
 }.run()
 
}
 
 class FakeExecutionHandler(){
 fun run(block:(Unit - Unit)) {
 
*/
