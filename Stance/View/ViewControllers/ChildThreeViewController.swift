//
//  ChildThreeViewController.swift
//  Stance
//
//  Created by Sukumar Anup Sukumaran on 19/02/2022.
//

import UIKit
import XLPagerTabStrip

class ChildThreeViewController: UIViewController {
    
    @IBOutlet weak var graphTableView: UITableView!
    
    var viewModel: HomeViewModel? {
        didSet {
           
        }
    }
    
    var itemInfo = IndicatorInfo(title: "Past Month")
    


    override func viewDidLoad() {
        super.viewDidLoad()
        graphTableView.delegate = viewModel
        graphTableView.dataSource = viewModel
    }


}

extension ChildThreeViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
}

