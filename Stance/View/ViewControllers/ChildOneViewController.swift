//
//  ChildOneViewController.swift
//  Stance
//
//  Created by Sukumar Anup Sukumaran on 19/02/2022.
//

import UIKit
import XLPagerTabStrip

class ChildOneViewController: UIViewController {
    
    @IBOutlet weak var graphTableView: UITableView!
    
    
    var viewModel: HomeViewModel? {
        didSet {
           
        }
    }
    
    var itemInfo = IndicatorInfo(title: "All Time")


    override func viewDidLoad() {
        super.viewDidLoad()
        graphTableView.delegate = viewModel
        graphTableView.dataSource = viewModel
        // Do any additional setup after loading the view.
    }
    

}

extension ChildOneViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
}
