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
            let vc = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            vc.viewModel = HomeViewModel()
            let nav = UINavigationController.init(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            container.topViewController = nav
        }
    }
    
    
}

extension MyWorkoutViewController {
    
    func setHandler() {
        viewModel.selectionHandler = { [weak self] model in
            guard let controller = self else {return}
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "StartWorkOutViewController") as! StartWorkOutViewController
            vc.viewModel = StartWorkOutViewModel(workoutModel: model)
            //let nav = UINavigationController(rootViewController: vc)
            //nav.modalPresentationStyle = .fullScreen
            controller.navigationController?.pushViewController(vc, animated: true)
//            controller.present(nav, animated: true, completion: nil)
        }
    }
}
