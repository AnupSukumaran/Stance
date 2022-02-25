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
        settingUplabelsBtnTitles()
    }
    
    @IBAction func submitBtnAction(_ sender: UIButton) {
        showingAlertForEditAndSubmit()
    }
    
    @IBAction func leftBtnAction(_ sender: Any) {
        dismiss(animated: true) {
            self.callingHomeVC()
        }
    }
    
    @IBAction func closeAction(_ sender: UIButton) {
        callingHomeVC()
    }
    
}

extension ProfileViewController {
    
    func showingAlertForEditAndSubmit() {
        let msgTxt: String = viewModel.fromSignIn ? .alertMsg3 : .alertMsg4
        UIAlertController.showAlertWithComBLK(title: .alertTitle, message: msgTxt, buttonTitle: .btnTitle, selfClass: self) {
            guard self.viewModel.fromSignIn  else {
                self.callingHomeVC()
                return
            }
            self.dismiss(animated: true)
        }
    }
    
    func settingUplabelsBtnTitles() {
        leftView.isHidden = !viewModel.fromSignIn
        rightView.isHidden = viewModel.fromSignIn
        let btnTitle = viewModel.fromSignIn ? "SUBMIT" : "EDIT"
        submitBtn.setTitle(btnTitle, for: .normal)
    }
    
    func callingHomeVC() {
        guard let container = self.so_containerViewController else {return}
        let nav = UINavigationController.init(rootViewController: .homeVC)
        nav.modalPresentationStyle = .fullScreen
        container.topViewController = nav
    }
}


