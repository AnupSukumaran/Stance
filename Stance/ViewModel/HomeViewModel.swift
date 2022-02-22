//
//  HomeViewModel.swift
//  Stance
//
//  Created by Sukumar Anup Sukumaran on 19/02/2022.
//

import UIKit
import Charts



class HomeViewModel: NSObject {
    
    
    var cellModelArr = [CellModel]()
    
    init(cellModelArr: [CellModel] = []) {
        self.cellModelArr = cellModelArr
    }
    
    func adaptingTableViewCells(_ table: UITableView) {
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 600
    }
    

    
}

extension HomeViewModel: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cellModelArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellModelArr[section].graphType.count//cellModelArr.isEmpty ? 2 : cellModelArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GraphTableViewCell", for: indexPath) as! GraphTableViewCell
        cell.barChart.delegate = self
//        if cellModelArr.isEmpty {
//            cell.config()
//        } else {
            //cell.configV2( cellModel: cellModelArr[indexPath.row])
       // }
        
        cell.configV2(chartType: cellModelArr[indexPath.section].graphType[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeSectionTableViewCell") as! HomeSectionTableViewCell
        
        cell.config(cellModel: cellModelArr[section])
    
        return cell.contentView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 229
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 49
    }
    
    
}


extension HomeViewModel: ChartViewDelegate {
    
}
