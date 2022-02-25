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
        viewModel.setTestSession()
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
        sideViewController = .leftMenuVC
    }
}
