//
//  KataApp.swift
//  KataLogInLogOutSwift
//
//  Created by Lara Poveda on 20/9/18.
//  Copyright © 2018 prueba. All rights reserved.
//

import Foundation



class KataApp{
    var clock:Date!
    init(_ clock:Clock) {
        self.clock = clock.now
    }
    func logIn(username:String, password:String) -> Bool {
        
        if(username == "admin" && password == "admin"){
            return true
        }else{
            return false
        }
    }
    
    func logOut() -> Bool{
        let time = Int(clock.timeIntervalSince1970)
        return time % 2 == 0
    }
}
