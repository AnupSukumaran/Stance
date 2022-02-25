//
//  SignInViewController.swift
//  Stance
//
//  Created by Sukumar Anup Sukumaran on 22/02/2022.
//

import UIKit
import SASKeyboardPack
import SASCustomAlert

class SignInViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var passHideBtn: UIButton!
    @IBOutlet weak var activityIndic: UIActivityIndicatorView!
    
    var viewModel: SignInViewModel! {
        didSet {
            setHandler()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTF.text = .tempEmail
        password.text = .tempPass
        passHideBtn.setTitle("", for: .normal)
        KeyBrd().regKBNotific(scrollView, 120)
    
    }
    
    @IBAction func passBtnAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        password.isSecureTextEntry = !sender.isSelected
        let img = sender.isSelected ? UIImage(named: "visibility") : UIImage(named: "non-visibility")
        sender.setImage(img, for: .normal)
        
    }
    
    @IBAction func signInAction(_ sender: UIButton) {
        activityIndicAction()
    }
    
    @IBAction func forgotPasswordBtn(_ sender: UIButton) {}
    
    @IBAction func signUpAction(_ sender: UIButton) {
        
        let nav = UINavigationController(rootViewController: .profileVC)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true, completion: nil)
        
    }
    
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    deinit {
        KeyBrd().deregisterKBNotific()
    }
    
}

//MARK: Functions

extension SignInViewController {
    
    func setHandler() {
        viewModel?.alertHandler = { [weak self] in
            guard let vc = self else {return}
            UIAlertController.showAlert(title: .alertTitle, message: .alertMsg2, buttonTitle: .btnTitle, selfClass: vc)
        }
    }
    
    func activityIndicAction() {
        activityIndic.startAnimating()
        self.view.isUserInteractionEnabled = false
        self.view.alpha = 0.5
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.activityIndic.stopAnimating()
            self.view.isUserInteractionEnabled = true
            self.view.alpha = 1
            self.settingSessionCallingHomeViewController()
        }
        
    }
    
    func settingSessionCallingHomeViewController() {
        guard let email = emailTF.text, let password = password.text else {
            UIAlertController.showAlert(title: .alertTitle, message: .alertMsg, buttonTitle: .btnTitle, selfClass: self)
            return
        }

        guard viewModel.checkSuccess(email: email, password: password) else {return}
         
        guard let container = self.so_containerViewController else {return}
        
        let nav = UINavigationController.init(rootViewController: .homeVC)
        nav.modalPresentationStyle = .fullScreen
        container.topViewController = nav

    }
}


