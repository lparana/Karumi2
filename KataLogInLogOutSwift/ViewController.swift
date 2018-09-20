//
//  ViewController.swift
//  KataLogInLogOutSwift
//
//  Created by Lara Poveda on 20/9/18.
//  Copyright © 2018 prueba. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var LogButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pressLogIn(_ sender: UIButton) {
        
        let access = KataApp().logIn(username: usernameTextField.text!, password: PasswordTextField.text!)
        if access {LogButton.titleLabel?.text = "Log Out"}
    }
    
}

