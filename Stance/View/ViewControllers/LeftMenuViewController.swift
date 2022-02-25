//
//  LeftMenuViewController.swift
//  Stance
//
//  Created by Sukumar Anup Sukumaran on 20/02/2022.
//

import UIKit

class LeftMenuViewController: UIViewController {

    @IBOutlet weak var menuTable: UITableView!
    
    var viewModel: LeftMenuViewModel! {
        didSet {
            setHandlers()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTable.delegate = viewModel
        menuTable.dataSource = viewModel
    }
    
}

extension LeftMenuViewController {
    
    func setHandlers() {
        
        viewModel.itemSelectionHandler = { [weak self] index in
            guard let vc = self else {return}
            guard let container = vc.so_containerViewController else {return}
            container.isSideViewControllerPresented = false
            
            switch index {
            case 0:
                let nav = UINavigationController.init(rootViewController: .profileVC)
                    nav.modalPresentationStyle = .fullScreen
                    container.topViewController = nav
                
                
            case 1:
                let nav = UINavigationController.init(rootViewController: .myWorkoutVC)
                    nav.modalPresentationStyle = .fullScreen
                    container.topViewController = nav
                
                
            case 2:
                let nav = UINavigationController.init(rootViewController: .programmesVC)
                    nav.modalPresentationStyle = .fullScreen
                    container.topViewController = nav
            
                
            case 3: break
                
            
            case 4:
                    vc.viewModel.clearSession()
                    container.topViewController = .signInVC
               
            default:
                break
            }
        }
        
    }
    
}


