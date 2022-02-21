//
//  ProfileViewController.swift
//  Stance
//
//  Created by Sukumar Anup Sukumaran on 21/02/2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    var viewModel: ProfileViewModel! {
        didSet{
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

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


