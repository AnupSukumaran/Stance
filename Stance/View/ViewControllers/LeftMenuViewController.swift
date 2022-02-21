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
            switch index {
            case 0:
                
                if let container = vc.so_containerViewController {
                    container.isSideViewControllerPresented = false
                    let controller = vc.storyboard!.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
                    controller.viewModel = ProfileViewModel()
                    let nav = UINavigationController.init(rootViewController: controller)
                    nav.modalPresentationStyle = .fullScreen
                    container.topViewController = nav
                }
                
            case 1:
                
                if let container = vc.so_containerViewController {
                    container.isSideViewControllerPresented = false
                    let controller = vc.storyboard!.instantiateViewController(withIdentifier: "MyWorkoutViewController") as! MyWorkoutViewController
                    controller.viewModel = MyWorkoutViewModel(workoutItems: vc.viewModel.workoutItems)
                    let nav = UINavigationController.init(rootViewController: controller)
                    nav.modalPresentationStyle = .fullScreen
                    container.topViewController = nav
                }
                
            case 2:
                
                if let container = vc.so_containerViewController {
                    container.isSideViewControllerPresented = false
                    let controller = vc.storyboard!.instantiateViewController(withIdentifier: "ProgrammesViewController") as! ProgrammesViewController
                    controller.viewModel = ProgrammesViewModel(programesItems: vc.viewModel.programesItems)
                    let nav = UINavigationController.init(rootViewController: controller)
                    nav.modalPresentationStyle = .fullScreen
                    container.topViewController = nav
                }
                
            case 3:
                if let container = vc.so_containerViewController {
                    container.isSideViewControllerPresented = false
                }
            default:
                break
            }
        }
        
    }
    
}


