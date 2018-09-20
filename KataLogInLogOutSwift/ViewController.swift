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
    @IBOutlet weak var LogOutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        LogOutButton.isHidden = true
        //presentes = Presenter(kata)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressLogIn(_ sender: UIButton) {
        let kataApp = KataApp(Clock())
        let username = usernameTextField.text ?? ""
        let password = PasswordTextField.text ?? ""
        if kataApp.validateUsername(username: username) {
            self.showAlert("Invalid Username")
        }else{
            if kataApp.logIn(username: username, password: password) {
                LogButton.isHidden = true
                LogOutButton.isHidden = false
                usernameTextField.isHidden = true
                PasswordTextField.isHidden = true
            }else{
                self.showAlert("Bad Credentials")
            }
        }

    }
    
    @IBAction func tappLogOutButton(_ sender: UIButton) {
        let kataApp = KataApp(Clock())
        if kataApp.logOut() {
            LogButton.isHidden = false
            LogOutButton.isHidden = true
            usernameTextField.text = ""
            usernameTextField.isHidden = false
            PasswordTextField.text = ""
            PasswordTextField.isHidden = false
            
        }else {
            self.showAlert("Not pair second")
        }
    }
    
    func showAlert(_ message:String){
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

