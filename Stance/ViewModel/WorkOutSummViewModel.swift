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
    
    init(workSumModel: WorkSumModel?) {
        self.workSumModel = workSumModel
        self.navTitle = workSumModel?.viewTitle ?? ""
    }

}

extension WorkOutSummViewModel: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return workSumModel?.workSumSectionData.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count: Int?
        if workSumModel?.workSumSectionData[section].movSecTitle == nil {
            count = workSumModel?.workSumSectionData[section].timeModel.count
        } else {
            count = workSumModel?.workSumSectionData[section].movementModelArr.count
        }
        
        return count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell!
        
        guard let sectionData = workSumModel?.workSumSectionData[indexPath.section] else {return cell}
        
        if sectionData.movSecTitle == nil {
            let totCell = tableView.dequeueReusableCell(withIdentifier: "TotalTableViewCell", for: indexPath) as! TotalTableViewCell
            totCell.config(model: sectionData.timeModel[indexPath.row])
            cell = totCell
        } else {
            let exeCell = tableView.dequeueReusableCell(withIdentifier: "ExcerciseTableViewCell", for: indexPath) as! ExcerciseTableViewCell
            exeCell.config(model: sectionData.movementModelArr[indexPath.row])
            cell = exeCell
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SectionMovTableViewCell") as! SectionMovTableViewCell
        
        cell.sectionTitle.text = workSumModel?.workSumSectionData[section].movSecTitle
        
        return cell.contentView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return  workSumModel?.workSumSectionData[section].movSecTitle == nil  ? 0 : 45
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var cellHeight: CGFloat?
        
        if workSumModel?.workSumSectionData[indexPath.section].movSecTitle == nil {
            cellHeight = 65
        } else {
            cellHeight = 80
        }
        
        return cellHeight ?? 0
    }
    
    
}
