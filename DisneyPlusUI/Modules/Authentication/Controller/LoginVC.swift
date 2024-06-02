//
//  LoginVC.swift
//  DisneyPlusUI
//
//  Created by Sai Balaji on 01/06/24.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var signUpLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.isHidden = true
        self.signUpLbl.isUserInteractionEnabled = true
        self.signUpLbl.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(signUpLblTapped)))
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
   
    
    @objc func signUpLblTapped(){
        if let signUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpVC") as? SignUpVC{
            self.navigationController?.pushViewController(signUpVC, animated: true)
        }
    }
    
   

}
