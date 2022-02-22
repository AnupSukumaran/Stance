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
    
    var viewModel: SignInViewModel? {
        didSet {
           
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTF.text = "test@email.com"
        password.text = "password"
        passHideBtn.setTitle("", for: .normal)
        KeyBrd().regKBNotific(scrollView, 120)
        // Do any additional setup after loading the view.
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
    
    @IBAction func forgotPasswordBtn(_ sender: UIButton) {
        
    }
    
    @IBAction func signUpAction(_ sender: UIButton) {
        print("SignUp....")
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        
        vc.viewModel = ProfileViewModel(fromSignIn: true)
        
        let nav = UINavigationController(rootViewController: vc)
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


extension SignInViewController {
    
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

        guard let regEmail = UserDefaults.standard.value(forKey: .username) as? String,
              let regPassword = UserDefaults.standard.value(forKey: .password) as? String,
              email == regEmail,
              password == regPassword
        else {
            UIAlertController.showAlert(title: .alertTitle, message: .alertMsg2, buttonTitle: .btnTitle, selfClass: self)
            return
        }

        UserDefaults.standard.set("inSession", forKey: .sessionKey)

        if let container = self.so_containerViewController {
            let vc = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            vc.viewModel = HomeViewModel()
            let nav = UINavigationController.init(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            container.topViewController = nav
        }
    }
}
