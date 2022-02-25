//
//  SignInViewModel.swift
//  Stance
//
//  Created by Sukumar Anup Sukumaran on 22/02/2022.
//

import UIKit

class SignInViewModel: NSObject {
    
    var alertHandler: (() -> Void)?
    
    func checkSuccess(email: String, password: String) -> Bool {
        guard let regEmail = UserDefaults.standard.value(forKey: .username) as? String,
              let regPassword = UserDefaults.standard.value(forKey: .password) as? String,
              email == regEmail,
              password == regPassword
        else {
            alertHandler?()
            return false
        }

        UserDefaults.standard.set("inSession", forKey: .sessionKey)
        return true
    }

}
