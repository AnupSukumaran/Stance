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
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        myWorkoutList.dataSource = viewModel
        myWorkoutList.delegate = viewModel
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
