//
//  StartWorkOutViewModel.swift
//  Stance
//
//  Created by Sukumar Anup Sukumaran on 21/02/2022.
//

import UIKit

class StartWorkOutViewModel: NSObject {
    
    var workoutModel: WorkoutModel?
    
    var mainTitle: String?
    var subTitle: String?
    
    init(workoutModel: WorkoutModel? = nil) {
        self.workoutModel = workoutModel
        mainTitle = workoutModel?.workOutTitle
        subTitle = "\(workoutModel?.numOfSections ?? "-") • \(workoutModel?.numOfExcercises ?? "-") • \(workoutModel?.workoutMins ?? "-")"
    }
    
}

extension StartWorkOutViewModel: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return workoutModel?.sectionData.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workoutModel?.sectionData[section].workouts.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WorkOutExeTableViewCell", for: indexPath) as! WorkOutExeTableViewCell
        if let val = workoutModel?.sectionData[indexPath.section].workouts[indexPath.row] {
            cell.config(workOuts: val)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SectionTableViewCell") as! SectionTableViewCell
        
        cell.config(sectionData: workoutModel?.sectionData[section])
    
        return cell.contentView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 32
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 78
    }
    
    
}
