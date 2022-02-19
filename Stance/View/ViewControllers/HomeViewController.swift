//
//  HomeViewController.swift
//  Stance
//
//  Created by Sukumar Anup Sukumaran on 19/02/2022.
//

import UIKit
import Charts

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var graphTableView: UITableView!
    
    var viewModel: HomeViewModel? {
        didSet {
           
        }
    }
    
    //var barChart = BarChartView()

    override func viewDidLoad() {
        super.viewDidLoad()
        graphTableView.delegate = viewModel
        graphTableView.dataSource = viewModel
       // barChart.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    

}


//
//extension HomeViewController: ChartViewDelegate {
//
//}
