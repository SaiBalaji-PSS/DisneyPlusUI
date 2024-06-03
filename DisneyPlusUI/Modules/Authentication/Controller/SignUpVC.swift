//
//  SignUpVC.swift
//  DisneyPlusUI
//
//  Created by Sai Balaji on 01/06/24.
//

import UIKit
import Combine


class SignUpVC: UIViewController {


    
    private var vm = SignUpViewModel()
    
    private var passwordTextFieldSubscriber: AnyCancellable?
    private var passwordStrengthSubscriber: AnyCancellable?
    private var passwordStengthColorSubscriber: AnyCancellable?
    private var passwordStrengthTextSubscriber:AnyCancellable?
    private var authErrorSubscriber: AnyCancellable?
    
    @IBOutlet weak var passwordStrengthLbl: UILabel!
    @IBOutlet weak var emailTextField: CustomTextField!
    
    @IBOutlet weak var passwordTextField: CustomTextField!
    
    @IBOutlet weak var passwordStrengthProgressBar: UIProgressView!
    
    @IBOutlet weak var retypePasswordTextField: CustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureUI()
        setupBindings()
    }
    
    func configureUI(){
        self.navigationController?.navigationBar.isHidden = true
        self.passwordStrengthLbl.text = ""
        passwordTextFieldSubscriber = NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification,object: passwordTextField)
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .sink(receiveValue: { value  in
                if let passwordTextField = value.object as? UITextField{
                
                    self.vm.checkPasswordStrength(passwordText: passwordTextField.text ?? "")
                }
            })
    }
    
    func setupBindings(){
        passwordStrengthSubscriber = vm.$passwordStrengthValue.receive(on: RunLoop.main).sink(receiveValue: { value in
            self.passwordStrengthProgressBar.setProgress(Float(value), animated: true)
        })
        passwordStengthColorSubscriber = vm.$passwordProgressColor.receive(on: RunLoop.main).sink(receiveValue: { value in
            self.passwordStrengthProgressBar.progressTintColor = value
        })
        passwordStrengthTextSubscriber = vm.$passwordStrengthText.receive(on: RunLoop.main).sink(receiveValue: { value in
            self.passwordStrengthLbl.text = value
        })
        authErrorSubscriber = vm.$error.receive(on: RunLoop.main).sink(receiveValue: { error  in
            if let error{
                print(error)
                
            }
        })
        
    }

    @IBAction func backBtnPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signUpBtnPressed(_ sender: Any) {
        if passwordTextField.text == retypePasswordTextField.text{
            if let email = emailTextField.text, let password = passwordTextField.text{
                vm.signUpEmailPassword(email: email, password: password)
            }
        }
    }
    
    
    
    
    
}


