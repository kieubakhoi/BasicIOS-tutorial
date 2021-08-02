//
//  LoginViewController.swift
//  BasicIOS-tutorial-MVVM
//
//  Created by Apple on 02/08/2021.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    var viewModel = LoginViewModel(email: "Example@gamil.com", password: "12341234")
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //MARK: - config
    override func setupUI() {
        super.setupUI()
        self.title = "Login"
        updateView()
    }
    override func setupData() {
        
    }
    func updateView() {
        emailTextField.text = viewModel.email
        passwordTextField.text = viewModel.password
    }
    @IBAction func loginButton(_ sender: Any) {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        // make value for closure
        let complete : LoginViewModel.Completion = {(result) in
            switch result {
            case .success:
                // do something
                print("Dang nhap thanh cong")
                self.updateView()
                
                //change root
                let scene = UIApplication.shared.connectedScenes.first
                if let sd: SceneDelegate = (scene?.delegate as? SceneDelegate) {
                    sd.changeScreen(type: .tabbar)
                }
            case .failure(let isError, let ErrorMsg):
                if(isError) {
                    print("Dang nhap that bai")
                    print(ErrorMsg)
                }
            }
        }
        // call func
            viewModel.login(email: email, password: password, completion: complete)

    }
}
