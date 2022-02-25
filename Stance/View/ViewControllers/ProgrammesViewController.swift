//
//  ProgrammesViewController.swift
//  Stance
//
//  Created by Sukumar Anup Sukumaran on 20/02/2022.
//

import UIKit

class ProgrammesViewController: UIViewController {
    
    
    @IBOutlet weak var programsTableView: UITableView!
    
    
    var viewModel: ProgrammesViewModel! {
        didSet{
            setHandler()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        programsTableView.delegate = viewModel
        programsTableView.dataSource = viewModel
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


extension ProgrammesViewController {
    
    func setHandler() {
        viewModel.selectionHandler = { model in
            let viewM = WorkOutSummViewModel(workSumModel: model)
            self.navigationController?.pushViewController(.callVCWorkOutSummViewCntr(viewModel: viewM), animated: true)
        }
    }
}
