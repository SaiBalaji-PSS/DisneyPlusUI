//
//  ViewController.swift
//  DisneyPlusUI
//
//  Created by Sai Balaji on 01/06/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.isHidden = true
    }

    @IBAction func signUpBtnPressed(_ sender: Any) {
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        if let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as? LoginVC{
            self.navigationController?.pushViewController(loginVC, animated: true)
        }
    }
    
    
    
}

