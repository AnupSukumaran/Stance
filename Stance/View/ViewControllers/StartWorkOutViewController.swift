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
    @IBOutlet weak var startBtn: UIButton!
    
    var viewModel: StartWorkOutViewModel! {
        didSet {
            setHandler()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = ""
        workoutList.delegate = viewModel
        workoutList.dataSource = viewModel
        workOutTitle.text = viewModel.mainTitle
        subTitle.text = viewModel.subTitle
    }
    
    
    @IBAction func startWorkoutAction(_ sender: Any) {
    }
    
}

extension StartWorkOutViewController {
    func setHandler() {
        
    }
}
