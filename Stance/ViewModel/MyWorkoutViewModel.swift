//
//  MyWorkoutViewModel.swift
//  Stance
//
//  Created by Sukumar Anup Sukumaran on 20/02/2022.
//

import UIKit

class MyWorkoutViewModel: NSObject {
    
    var workoutItems = [MenuModel]()
    
    init(workoutItems: [MenuModel] = []) {
        self.workoutItems = workoutItems
    }
}


extension MyWorkoutViewModel: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workoutItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItemTableViewCell", for: indexPath) as! MenuItemTableViewCell
        cell.config(workoutItems[indexPath.row])
        return cell
    }
    
    
}
