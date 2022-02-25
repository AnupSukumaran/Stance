//
//  MyWorkoutViewController.swift
//  Stance
//
//  Created by Sukumar Anup Sukumaran on 20/02/2022.
//

import UIKit

class MyWorkoutViewController: UIViewController {
    
   
    @IBOutlet weak var myWorkoutList: UITableView!
    
    var viewModel: MyWorkoutViewModel! {
        didSet {
            setHandler()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        myWorkoutList.dataSource = viewModel
        myWorkoutList.delegate = viewModel
    }
    
    @IBAction func closeAction(_ sender: UIButton) {
        if let container = self.so_containerViewController {
            let nav = UINavigationController.init(rootViewController: .homeVC)
            nav.modalPresentationStyle = .fullScreen
            container.topViewController = nav
        }
    }
    
}

extension MyWorkoutViewController {
    
    func setHandler() {
        viewModel.selectionHandler = { [weak self] model in
            self?.navigationController?.pushViewController(.startWorkOutVC(model: model), animated: true)
        }
    }
}
