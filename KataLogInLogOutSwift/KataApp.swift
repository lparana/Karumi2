//
//  KataApp.swift
//  KataLogInLogOutSwift
//
//  Created by Lara Poveda on 20/9/18.
//  Copyright © 2018 prueba. All rights reserved.
//

import Foundation



class KataApp {
    
    public func logIn(username:String, password:String) -> Bool {
        
        if(username == "admin" && password == "admin"){
            return true
        }else{
            return false
        }
    }
}
