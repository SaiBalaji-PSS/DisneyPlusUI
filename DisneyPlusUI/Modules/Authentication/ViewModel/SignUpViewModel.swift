//
//  SignUpViewModel.swift
//  DisneyPlusUI
//
//  Created by Sai Balaji on 02/06/24.
//

import Foundation
import Combine
import UIKit



class SignUpViewModel: ObservableObject{
    @Published var passwordStrengthValue = 0.0
    @Published var passwordStrengthText = ""
    @Published var passwordProgressColor = UIColor.clear
    private let lowercasePattern = ".*[a-z]+.*"
    private let digitPattern = ".*[0-9]+.*"
    private let specialCharacterPattern = ".*[!@#$%^&*(),.?\":{}|<>]+.*"
    
    
    func checkPasswordStrength(passwordText: String){
        if passwordText.isEmpty{
            self.passwordStrengthValue = 0.0
            self.passwordStrengthText = ""
            return
        }
        let range = NSRange(location: 0, length: passwordText.utf16.count)
        
        guard let lowerCaseExpression = try? NSRegularExpression(pattern: lowercasePattern)else{return }
        guard let digitExpression = try? NSRegularExpression(pattern: digitPattern)else{return }
        guard let specialCharacterExpression = try? NSRegularExpression(pattern: specialCharacterPattern)else{return }
        //lower case -> digit -> specialcase  || lowercase -> digit || special case
        if lowerCaseExpression.firstMatch(in: passwordText, range: range) != nil{
            self.passwordStrengthValue = 0.2
            self.passwordStrengthText = "Weak"
            self.passwordProgressColor = UIColor.red
            //digit
            if digitExpression.firstMatch(in: passwordText, range: range) != nil{
                self.passwordStrengthValue = 0.4
                self.passwordStrengthText = "Medium"
                self.passwordProgressColor = UIColor.yellow
                //special case
                if specialCharacterExpression.firstMatch(in: passwordText, range: range) != nil{
                    self.passwordStrengthValue = 0.5
                    self.passwordStrengthText = "Medium"
                    self.passwordProgressColor = UIColor.yellow
                    if passwordText.count >= 6{
                        self.passwordStrengthValue = 1.0
                        self.passwordStrengthText = "Strong"
                        self.passwordProgressColor = UIColor.green
                    }
                }
                else{
                    if passwordText.count >= 6{
                        self.passwordStrengthValue = 1.0
                        self.passwordStrengthText = "Strong"
                        self.passwordProgressColor = UIColor.green
                    }
                }
            }
            //or no digit only lower case and special case
            else{
                if specialCharacterExpression.firstMatch(in: passwordText, range: range) != nil{
                    self.passwordStrengthValue = 0.5
                    self.passwordStrengthText = "Medium"
                    self.passwordProgressColor = UIColor.yellow
                    if passwordText.count >= 6{
                        self.passwordStrengthValue = 1.0
                        self.passwordStrengthText = "Strong"
                        self.passwordProgressColor = UIColor.green
                    }
                }
            }
        }
    }
}
