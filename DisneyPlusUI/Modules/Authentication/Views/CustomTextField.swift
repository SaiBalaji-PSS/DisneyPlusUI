//
//  CustomTextField.swift
//  DisneyPlusUI
//
//  Created by Sai Balaji on 01/06/24.
//

import UIKit

@IBDesignable
class CustomTextField: UITextField {

    override  func prepareForInterfaceBuilder(){
        configure()
       
    }
    override  func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    func configure(){
        textColor = UIColor.white
        self.setLeftPaddingPoints(8.0)
        self.backgroundColor = #colorLiteral(red: 0.1921568627, green: 0.2, blue: 0.2392156863, alpha: 1)
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 4.0
        if let placeholder = placeholder{
            self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor:UIColor.white])
        }
    }
    

}


extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
