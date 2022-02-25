//
//  MyWorkoutViewModel.swift
//  Stance
//
//  Created by Sukumar Anup Sukumaran on 20/02/2022.
//

import UIKit

class MyWorkoutViewModel: NSObject {
    
    var workoutItems = [MenuModel]()
    
    var workOuts1: [WorkOuts] = [
        WorkOuts(exeImg: UIImage(named: "Chest"), equipmentStatus: true, exeName: "Chest Fly", reps: "12 Reps", refreshActive: false),
        WorkOuts(exeImg: UIImage(named: "Legs"), exeName: "Mountain Climber", reps: "40 Reps (20 Per Side)", refreshActive: false)]
    
    var workOuts2: [WorkOuts] = [
        WorkOuts(exeImg: UIImage(named: "Chest"), equipmentStatus: false, exeName: "Bench Press", reps: "15 Reps", refreshActive: true),
        WorkOuts(exeImg: UIImage(named: "30"), exeName: "Rest", reps: "30 Seconds", forRest: true, refreshActive: false),
        WorkOuts(exeImg: UIImage(named: "Chest"), equipmentStatus: false, exeName: "Bench Press", reps: "15 Reps", refreshActive: true),
        WorkOuts(exeImg: UIImage(named: "30"), exeName: "Rest", reps: "30 Seconds", forRest: true, refreshActive: false),
        WorkOuts(exeImg: UIImage(named: "Chest"), equipmentStatus: false, exeName: "Bench Press", reps: "15 Reps", refreshActive: true)]
    
    var sectionData = [SectionData]()
    var workoutsData = [WorkoutModel]()
    
    var selectionHandler: ((WorkoutModel) -> Void)?
    
    init(workoutItems: [MenuModel] = []) {
        self.workoutItems = workoutItems
        
        sectionData = [
            SectionData(sectionTitle: "ACTIVATION 2", numOfExcercises: "2 Excercises", workoutMins: "4 Minutes", workouts: workOuts1),
            SectionData(sectionTitle: "PYRAMID 1", numOfExcercises: "3 Sets", workouts: workOuts2)
        ]
        
        workoutsData = [
            WorkoutModel(id: 0, workOutTitle: "Chest & Triceps", numOfSections: "7 Sections", numOfExcercises: "11 Excercises", workoutMins: "40-55 Mins", sectionData: sectionData),
            WorkoutModel(id: 1, workOutTitle: "Arms", numOfSections: "7 Sections", numOfExcercises: "11 Excercises", workoutMins: "40-55 Mins", sectionData: sectionData),
            WorkoutModel(id: 2, workOutTitle: "Legs", numOfSections: "7 Sections", numOfExcercises: "11 Excercises", workoutMins: "40-55 Mins", sectionData: sectionData),
            WorkoutModel(id: 3, workOutTitle: "Back", numOfSections: "7 Sections", numOfExcercises: "11 Excercises", workoutMins: "40-55 Mins", sectionData: sectionData),
            WorkoutModel(id: 4, workOutTitle: "Shoulders", numOfSections: "7 Sections", numOfExcercises: "11 Excercises", workoutMins: "40-55 Mins", sectionData: sectionData),
            WorkoutModel(id: 5, workOutTitle: "Core", numOfSections: "7 Sections", numOfExcercises: "11 Excercises", workoutMins: "40-55 Mins", sectionData: sectionData),
            WorkoutModel(id: 6, workOutTitle: "Custom Programme", numOfSections: "7 Sections", numOfExcercises: "11 Excercises", workoutMins: "40-55 Mins", sectionData: sectionData)
        ]

    }
}


extension MyWorkoutViewModel: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workoutItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItemTableViewCell", for: indexPath) as! MenuItemTableViewCell
        cell.menuIcon.layer.cornerRadius = 10
        cell.config(workoutItems[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let workoutsData = workoutsData.filter({indexPath.row == ($0.id ?? 0)}).first {
            selectionHandler?(workoutsData)
        }
    }
    
    
}
