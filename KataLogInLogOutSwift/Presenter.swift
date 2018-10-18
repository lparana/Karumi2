//
//  Presenter.swift
//  KataLogInLogOutSwift
//
//  Created by Lara Poveda on 20/9/18.
//  Copyright © 2018 prueba. All rights reserved.
//

import Foundation


class Presenter{
    
    let view:View!
    let kata:KataApp!
    
    init(kata:KataApp, view:View){
        self.kata = kata
        self.view = view
    }
    
    func didTapLogInButton(username:String, password:String){
        if kata.validateUsername(username: username){
            view.showError("Wrong Username")
        }else{
            if kata.logIn(username: username, password: password){
                view.hideLogInForm()
                view.showLogOutForm()
            }else{
                view.showError("Bad Credentials")
            }
        }
    }
    
    func didTapLogOutButton(){
        if kata.logOut(){
            view.hideLogOutForm()
            view.showLogInForm()
        }else{
            view.showError("Log out Error")
        }
        
    }
}

protocol View{
    func showError(_ message: String)
    func showLogInForm()
    func hideLogInForm()
    func showLogOutForm()
    func hideLogOutForm()
    
}

