//
//  WorkOutSummViewModel.swift
//  Stance
//
//  Created by Sukumar Anup Sukumaran on 25/02/2022.
//

import UIKit

class WorkOutSummViewModel: NSObject {
    
    var workSumModel: WorkSumModel?
    var navTitle = ""
    
    init(workSumModel: WorkSumModel? = nil) {
        self.workSumModel = workSumModel
        self.navTitle = workSumModel?.viewTitle ?? ""
    }

}

extension WorkOutSummViewModel {
    
    func getNumOfRowsInSec(index: Int) -> Int? {
        var count: Int?
        if workSumModel?.workSumSectionData[index].movSecTitle == nil {
            count = workSumModel?.workSumSectionData[index].timeModel.count
        } else {
            count = workSumModel?.workSumSectionData[index].movementModelArr.count
        }
        return count
    }
    
    func getTableCell(table: UITableView, indexPath: IndexPath) -> UITableViewCell? {
        var cell: UITableViewCell?
        
        guard let sectionData = workSumModel?.workSumSectionData[indexPath.section] else {return cell}
        
        if sectionData.movSecTitle == nil {
            let totCell = table.dequeueReusableCell(withIdentifier: "TotalTableViewCell", for: indexPath) as! TotalTableViewCell
            totCell.config(model: sectionData.timeModel[indexPath.row])
            cell = totCell
        } else {
            let exeCell = table.dequeueReusableCell(withIdentifier: "ExcerciseTableViewCell", for: indexPath) as! ExcerciseTableViewCell
            exeCell.config(model: sectionData.movementModelArr[indexPath.row])
            cell = exeCell
        }
        
        return cell
    }
    
    func getSectionCell(table: UITableView, secIndex: Int) -> UIView? {
        let cell = table.dequeueReusableCell(withIdentifier: "SectionMovTableViewCell") as! SectionMovTableViewCell
        
        cell.sectionTitle.text = workSumModel?.workSumSectionData[secIndex].movSecTitle
        
        return cell.contentView
    }
    
    func getCellAndSectionHeight(index: Int) -> CGFloat {
        var cellHeight: CGFloat?
        
        if workSumModel?.workSumSectionData[index].movSecTitle == nil {
            cellHeight = 65
        } else {
            cellHeight = 80
        }
        
        return cellHeight ?? 0
    }
}

extension WorkOutSummViewModel: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return workSumModel?.workSumSectionData.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getNumOfRowsInSec(index: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return getTableCell(table: tableView, indexPath: indexPath) ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return getSectionCell(table: tableView, secIndex: section)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return  workSumModel?.workSumSectionData[section].movSecTitle == nil  ? 0 : 45
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return getCellAndSectionHeight(index: indexPath.section)
    }
    
    
}
