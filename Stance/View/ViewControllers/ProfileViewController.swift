//
//  ProfileViewController.swift
//  Stance
//
//  Created by Sukumar Anup Sukumaran on 21/02/2022.
//

import UIKit
import SASCustomAlert

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var leftView: UIView!
    
    @IBOutlet weak var rightView: UIView!
    
    
    @IBOutlet weak var leftBtn: UIButton!
    @IBOutlet weak var closeBtn: UIButton!
    
    @IBOutlet weak var submitBtn: UIButton!
    
    var viewModel: ProfileViewModel! {
        didSet{
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        leftView.isHidden = !viewModel.fromSignIn
        rightView.isHidden = viewModel.fromSignIn
        let btnTitle = viewModel.fromSignIn ? "SUBMIT" : "EDIT"
        submitBtn.setTitle(btnTitle, for: .normal)
    }
    
    
    
    
    @IBAction func submitBtnAction(_ sender: UIButton) {
        let msgTxt: String = viewModel.fromSignIn ? .alertMsg3 : .alertMsg4
        UIAlertController.showAlertWithComBLK(title: .alertTitle, message: msgTxt, buttonTitle: .btnTitle, selfClass: self) {
            
            
            if self.viewModel.fromSignIn {
                
                self.dismiss(animated: true)
                
            } else {
                if let container = self.so_containerViewController {
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                    vc.viewModel = HomeViewModel()
                    let nav = UINavigationController.init(rootViewController: vc)
                    nav.modalPresentationStyle = .fullScreen
                    container.topViewController = nav
                }
            }
            
            
            
        }
    }
    
    @IBAction func leftBtnAction(_ sender: Any) {
        
        dismiss(animated: true) {
            
            if let container = self.so_containerViewController {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                vc.viewModel = HomeViewModel()
                let nav = UINavigationController.init(rootViewController: vc)
                nav.modalPresentationStyle = .fullScreen
                container.topViewController = nav
            }
            
        }
        
    }
    
    @IBAction func closeAction(_ sender: UIButton) {
        if let container = self.so_containerViewController {
            let vc = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            vc.viewModel = HomeViewModel()
            let nav = UINavigationController.init(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            container.topViewController = nav
        }
    }
    
    
    

}


