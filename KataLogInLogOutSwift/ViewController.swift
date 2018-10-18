//
//  ViewController.swift
//  KataLogInLogOutSwift
//
//  Created by Lara Poveda on 20/9/18.
//  Copyright © 2018 prueba. All rights reserved.
//

import UIKit

class ViewController: UIViewController, View {
    
    func showLogInForm() {
        LogButton.isHidden = false
        usernameTextField.text = ""
        usernameTextField.isHidden = false
        PasswordTextField.text = ""
        PasswordTextField.isHidden = false
    }
    
    func hideLogInForm() {
        LogButton.isHidden = true
        usernameTextField.text = ""
        usernameTextField.isHidden = true
        PasswordTextField.text = ""
        PasswordTextField.isHidden = true
    }
    
    func showLogOutForm() {
        LogOutButton.isHidden = false
    }
    
    func hideLogOutForm() {
        LogOutButton.isHidden = true
    }
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var LogButton: UIButton!
    @IBOutlet weak var LogOutButton: UIButton!
    
    var presenter:Presenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        LogOutButton.isHidden = true
        presenter = Presenter(kata: KataApp(Clock()), view: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressLogIn(_ sender: UIButton) {
        
        //let kataApp = KataApp(Clock())
        let username = usernameTextField.text ?? ""
        let password = PasswordTextField.text ?? ""
        presenter.didTapLogInButton(username: username, password: password)

    }
    
    @IBAction func tappLogOutButton(_ sender: UIButton) {
        presenter.didTapLogOutButton()
    }
    
    func showError(_ message:String){
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

