//
//  ContainerViewController.swift
//  Stance
//
//  Created by Sukumar Anup Sukumaran on 20/02/2022.
//

import UIKit
import SidebarOverlay

class ContainerViewController: SOContainerViewController {
    
    let viewModel = ContainerViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.set("test@email.com", forKey: .username)
        UserDefaults.standard.set("password", forKey: .password)
        setTopView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        settingSideView()
    }
    

}

extension ContainerViewController {
    
    func setTopView() {
        let nav = UINavigationController.init(rootViewController: .homeVC)
        nav.modalPresentationStyle = .fullScreen
        topViewController = (UserDefaults.standard.value(forKey: .sessionKey) == nil) ? .signInVC : nav
    }
    
    func settingSideView() {
        sideMenuWidth = view.frame.width - viewModel.width
        let vc = storyboard?.instantiateViewController(withIdentifier: "LeftMenuViewController") as! LeftMenuViewController
        vc.viewModel = LeftMenuViewModel(menuItems: viewModel.menuItems)
        sideViewController = vc
        
    }
}
