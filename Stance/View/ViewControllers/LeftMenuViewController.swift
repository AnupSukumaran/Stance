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
            case 0: break
            case 1:
                
                if let container = vc.so_containerViewController {
                    container.isSideViewControllerPresented = false
                    let controller = vc.storyboard!.instantiateViewController(withIdentifier: "MyWorkoutViewController") as! MyWorkoutViewController
                    controller.viewModel = MyWorkoutViewModel(workoutItems: vc.viewModel.workoutItems)
                    let nav = UINavigationController.init(rootViewController: controller)
                    nav.modalPresentationStyle = .fullScreen
                    container.topViewController = nav
                }
                
            case 2: break
            case 3: break
            default:
                break
            }
        }
        
    }
}


