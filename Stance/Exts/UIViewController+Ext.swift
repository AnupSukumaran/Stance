//
//  UIViewController+Ext.swift
//  Stance
//
//  Created by Sukumar Anup Sukumaran on 24/02/2022.
//

import UIKit


extension UIViewController {
    
    static var mainStoryBoard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    
    static var signInVC: SignInViewController {
        let signInVC = mainStoryBoard.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        signInVC.viewModel = SignInViewModel()
        
        return signInVC
    }
    
    static var homeVC: HomeViewController {
        
        let vc = mainStoryBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        vc.viewModel = HomeViewModel()
    
        return vc
    }
    
    static var profileVC: ProfileViewController {
        let vc = mainStoryBoard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        vc.viewModel = ProfileViewModel(fromSignIn: true)
        return vc
    }
    
    
    
    static var repCntViewCntr: RepCounterViewController {
        let vc = mainStoryBoard.instantiateViewController(withIdentifier: "RepCounterViewController") as! RepCounterViewController
        vc.viewModel = RepCounterViewModel(secs: 2)
        vc.modalPresentationStyle = .fullScreen
        return vc
    }
    
    static var restViewCntr: RestViewController {
        let vc = mainStoryBoard.instantiateViewController(withIdentifier: "RestViewController") as! RestViewController
        vc.viewModel = RepCounterViewModel(secs: 3)
        vc.modalPresentationStyle = .fullScreen
        return vc
    }
    
    static var childOneVC: ChildOneViewController {
        let child_1 = mainStoryBoard.instantiateViewController(withIdentifier: "ChildOneViewController") as! ChildOneViewController
        child_1.viewModel = HomeViewModel()
        return child_1
    }
    
    static var childTwoVC: ChildTwoViewController {
        let child_2 = mainStoryBoard.instantiateViewController(withIdentifier: "ChildTwoViewController") as! ChildTwoViewController
        child_2.viewModel = HomeViewModel()
        return child_2
    }
    static var childThreeVC: ChildThreeViewController {
        let child_3 = mainStoryBoard.instantiateViewController(withIdentifier: "ChildThreeViewController") as! ChildThreeViewController
        child_3.viewModel = HomeViewModel()
        return child_3
    }
    
    static func restViewCntrCall(delegate: RepCounterViewModelDelegate) -> RestViewController {
        
        let vc = mainStoryBoard.instantiateViewController(withIdentifier: "RestViewController") as! RestViewController
        vc.viewModel = RepCounterViewModel(secs: 3, delegate: delegate)
        vc.modalPresentationStyle = .fullScreen
        return vc
        
    }
    
    static func callVCWorkOutSummViewCntr(viewModel: WorkOutSummViewModel) -> WorkOutSummViewController {
        
        let vc = mainStoryBoard.instantiateViewController(withIdentifier: "WorkOutSummViewController") as! WorkOutSummViewController
        vc.viewModel = viewModel
        vc.modalPresentationStyle = .fullScreen
        return vc
        
    }
    
    
    
    
}


