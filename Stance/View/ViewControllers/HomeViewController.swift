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

    
    var isReload = false
    
    var viewModel: HomeViewModel? {
        didSet {
           
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        reloadPagerTabStripView()
        
        buttonBarView.selectedBar.backgroundColor = #colorLiteral(red: 0.3767479658, green: 0.2980642319, blue: 0.972814858, alpha: 1)
        buttonBarView.backgroundColor = #colorLiteral(red: 0.1176470444, green: 0.1176470444, blue: 0.1176470444, alpha: 1)
        settings.style.buttonBarItemBackgroundColor = #colorLiteral(red: 0.1176470444, green: 0.1176470444, blue: 0.1176470444, alpha: 1)
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = #colorLiteral(red: 0.278431356, green: 0.278431356, blue: 0.278431356, alpha: 1)
            newCell?.label.textColor = #colorLiteral(red: 0.9372548461, green: 0.9372548461, blue: 0.9372548461, alpha: 1)
        }
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        let str = UIStoryboard(name: "Main", bundle: nil)
        
        let child_1 = str.instantiateViewController(withIdentifier: "ChildOneViewController") as! ChildOneViewController
        child_1.viewModel = HomeViewModel()
        let child_2 = str.instantiateViewController(withIdentifier: "ChildTwoViewController") as! ChildTwoViewController
        child_2.viewModel = HomeViewModel()
        let child_3 = str.instantiateViewController(withIdentifier: "ChildThreeViewController") as! ChildThreeViewController
        child_3.viewModel = HomeViewModel()


        let childViewControllers = [child_1, child_2, child_3]


        return childViewControllers
    }
    

}



