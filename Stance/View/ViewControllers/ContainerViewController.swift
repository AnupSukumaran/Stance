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
        setTopView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        settingSideView()
    }
    

}

extension ContainerViewController {
    
    func setTopView() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        vc.viewModel = HomeViewModel()
        let nav = UINavigationController.init(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        topViewController = nav
    }
    
    func settingSideView() {
        sideMenuWidth = view.frame.width - viewModel.width
        let vc = storyboard?.instantiateViewController(withIdentifier: "LeftMenuViewController") as! LeftMenuViewController
        vc.viewModel = LeftMenuViewModel(menuItems: viewModel.menuItems)
        sideViewController = vc
        
    }
}
