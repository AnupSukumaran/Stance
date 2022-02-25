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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        graphTableView.delegate = viewModel
        graphTableView.dataSource = viewModel
    }
  
}

extension ChildOneViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: .tab1)
    }
}
