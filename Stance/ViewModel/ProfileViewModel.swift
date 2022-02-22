//
//  ProfileViewModel.swift
//  Stance
//
//  Created by Sukumar Anup Sukumaran on 21/02/2022.
//

import UIKit

class ProfileViewModel: NSObject {

    var fromSignIn: Bool = true
    
    init(fromSignIn: Bool) {
        self.fromSignIn = fromSignIn
    }
}
