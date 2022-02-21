//
//  StartWorkOutViewController.swift
//  Stance
//
//  Created by Sukumar Anup Sukumaran on 21/02/2022.
//

import UIKit

class StartWorkOutViewController: UIViewController {
    
    @IBOutlet weak var workOutTitle: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var workoutList: UITableView!
    
    var viewModel: StartWorkOutViewModel! {
        didSet {
            setHandler()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        workoutList.delegate = viewModel
        workoutList.dataSource = viewModel
        workOutTitle.text = viewModel.mainTitle
        subTitle.text = viewModel.subTitle
    }
    
}

extension StartWorkOutViewController {
    func setHandler() {
        
    }
}
