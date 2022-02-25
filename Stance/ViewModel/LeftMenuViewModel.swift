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
    
    init(menuItems:[MenuModel] = []) {
        self.menuItems = menuItems
    }

}

extension LeftMenuViewModel {
    func clearSession() {
        UserDefaults.standard.removeObject(forKey: .sessionKey)
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
    }

}
