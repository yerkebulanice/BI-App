//
//  ViewController.swift
//  Bi Hack
//
//  Created by Еркебулан on 12.04.2021.
//

import UIKit
import Firebase
class ViewController: UIViewController {
    var signup:Bool = true {
        willSet{
            if newValue {
                nameTitle.text = "Регистрация"
                justText.isHidden = false
                signUpTo.isHidden = false
                loginButton.setTitle("Зарегистрироваться", for: .normal)
            }else{
                nameTitle.text = "Авторизация"
                justText.isHidden = true
                signUpTo.isHidden = true
                loginButton.setTitle("Войти", for: .normal)
            }
        }
    }
    @IBOutlet weak var nameTitle: UILabel!
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var justText: UILabel!
    @IBOutlet weak var signUpTo: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        loginField.delegate = self
        passwordField.delegate = self
    }

    @IBAction func loginToSystem(_ sender: UIButton) {
        signup = !signup
        if(signup){
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            if let vc = storyboard.instantiateViewController(withIdentifier: "TabBarViewController") as? TabBarViewController {
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }
        }
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Ошибка", message: "Заполните все поля", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: false, completion: nil)
        
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let login = loginField.text!
        let password = passwordField.text!
        if(signup) {
            if(!login.isEmpty && !password.isEmpty) {
                Auth.auth().createUser(withEmail: login, password: password) { (result, error) in
                    if error == nil{
                        if let result = result {
                            print(result.user.uid)
                        }
                    }
                }
            }else{
                showAlert()
            }
        }else{
            if(!login.isEmpty && !password.isEmpty) {
                
            }else{
                showAlert()
            }
        }
        return true
    }
}
