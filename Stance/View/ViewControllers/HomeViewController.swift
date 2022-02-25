//
//  HomeViewController.swift
//  Stance
//
//  Created by Sukumar Anup Sukumaran on 19/02/2022.
//

import UIKit
import Charts
import XLPagerTabStrip

class HomeViewController: ButtonBarPagerTabStripViewController {

    @IBOutlet weak var menuBtn: UIBarButtonItem!
    
    var isReload = false

    var viewModel: HomeViewModel? {
        didSet {
           
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        settingUpTopTabs()
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        return [.childOneVC, .childTwoVC, .childThreeVC]
    }
    
    @IBAction func menuAction(_ sender: UIBarButtonItem) {
        guard let container = so_containerViewController else {return}
        container.isSideViewControllerPresented = true
    }
    
}


extension HomeViewController {
    
    func settingUpTopTabs() {
        reloadPagerTabStripView()
        buttonBarView.selectedBar.backgroundColor = #colorLiteral(red: 0.3767479658, green: 0.2980642319, blue: 0.972814858, alpha: 1)
        buttonBarView.backgroundColor = #colorLiteral(red: 0.1176470444, green: 0.1176470444, blue: 0.1176470444, alpha: 1)
        settings.style.buttonBarItemBackgroundColor = #colorLiteral(red: 0.1176470444, green: 0.1176470444, blue: 0.1176470444, alpha: 1)
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarItemFont = UIFont(name: "Avenir Next Demi Bold", size: 14.0) ?? UIFont.systemFont(ofSize: 14)
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = #colorLiteral(red: 0.278431356, green: 0.278431356, blue: 0.278431356, alpha: 1)
            newCell?.label.textColor = #colorLiteral(red: 0.9372548461, green: 0.9372548461, blue: 0.9372548461, alpha: 1)
        }
    }
    
}
