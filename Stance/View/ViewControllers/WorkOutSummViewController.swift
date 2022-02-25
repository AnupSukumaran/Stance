//
//  WorkOutSummViewController.swift
//  Stance
//
//  Created by Sukumar Anup Sukumaran on 25/02/2022.
//

import UIKit

class WorkOutSummViewController: UIViewController {
    
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var listView: UITableView!
    
    var viewModel: WorkOutSummViewModel! {
        didSet {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialViewSetUp()
    }

}

extension WorkOutSummViewController {
    
    fileprivate func navSetUp() {
        if #available(iOS 11.0, *) {
            
            self.navigationController?.navigationBar.topItem?.largeTitleDisplayMode = .always
            self.navigationController?.navigationBar.prefersLargeTitles = true
            self.navigationController?.navigationBar.largeTitleTextAttributes = [
                NSAttributedString.Key.font: UIFont(name: "Avenir Next Bold", size: 25) ?? UIFont.systemFont(ofSize: 25)
            ]
        }
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = ""
        
        self.title = viewModel.navTitle
    }
    
    func initialViewSetUp() {
        navSetUp()
        listView.delegate = viewModel
        listView.dataSource = viewModel
        captionLabel.text = viewModel.workSumModel?.caption ?? "-"
    }
}
