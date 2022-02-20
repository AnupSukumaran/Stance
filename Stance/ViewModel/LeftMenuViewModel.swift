//
//  LeftMenuViewModel.swift
//  Stance
//
//  Created by Sukumar Anup Sukumaran on 20/02/2022.
//

import UIKit
import SidebarOverlay

class LeftMenuViewModel: NSObject {
    
    var menuItems = [MenuModel]()
    var itemSelectionHandler: ((Int) -> Void)?
    
    var workoutItems: [MenuModel] = [MenuModel(imgIcon: UIImage(named: "Chest"), itemLable: "Chest"),
                                  MenuModel(imgIcon: UIImage(named: "Arms"), itemLable: "Arms"),
                                  MenuModel(imgIcon: UIImage(named: "Legs"), itemLable: "Legs"),
                                  MenuModel(imgIcon: UIImage(named: "Back"), itemLable: "Back"),
                                  MenuModel(imgIcon: UIImage(named: "Shoulders"), itemLable: "Shoulders"),
                                  MenuModel(imgIcon: UIImage(named: "Core"), itemLable: "Core"),
                                  MenuModel(imgIcon: UIImage(named: "Custom Programme"), itemLable: "Custom Programme")]
    
    init(menuItems:[MenuModel] = []) {
        self.menuItems = menuItems
    }

}

extension LeftMenuViewModel: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItemTableViewCell", for: indexPath) as! MenuItemTableViewCell
        cell.config(menuItems[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemSelectionHandler?(indexPath.row)
        
//        switch indexPath.row {
//            
//        case 0: break
//            
//        case 1: break
//            
//            
////            let vc = UIStoryboard().instantiateViewController(withIdentifier: "MyWorkoutViewController") as! MyWorkoutViewController
////            vc.viewModel = HomeViewModel()
////            let nav = UINavigationController.init(rootViewController: vc)
////            nav.modalPresentationStyle = .fullScreen
//            
//        case 2: break
//        case 3: break
//            
//        default:
//            break
//        }
    }
    
    
}
