//
//  RootPageViewController.swift
//  Instagram
//
//  Created by craterzone on 04/02/21.
//

import UIKit

//controlls the pages on swip in left or right direction
class RootPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate{
    
    //creating the array of UIViews (of different pages)
    lazy var vcArray : [UIViewController] = {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        let cameraVC = storyBoard.instantiateViewController(withIdentifier: "CameraVC")
        let appVC = storyBoard.instantiateViewController(withIdentifier: "AppVC")
        let messageVC = storyBoard.instantiateViewController(withIdentifier: "MessageVC")
        
        return [appVC, cameraVC, messageVC]
    }()
    
    //on load method
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate = self
        
        if let firstViewController = self.vcArray.first{
            self.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }

        // Do any additional setup after loading the view.
        
    }
    
    //for left swip
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        //getting the current view index
        guard let vcIndex = vcArray.firstIndex(of: viewController) else { return nil }
        
        //prev = current - 1
        let prevIndex = vcIndex - 1
        
        //round rotation to last page
        guard prevIndex >= 0 else { return vcArray.last }
        
        //if prev index is out of bound (> array size) then return nil
        guard vcArray.count > prevIndex else { return nil }
        
        //return view of previndex view
        return vcArray[prevIndex]
        
    }
    
    
    
    //for right swip
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        //getting the current view index
        guard let vcIndex = vcArray.firstIndex(of: viewController) else { return nil }
        
        //prev = current - 1
        let nextIndex = vcIndex + 1
        
        //round rotation to last page
        guard nextIndex < vcArray.count else { return vcArray.first }
        
        //if prev index is out of bound (> array size) then return nil
        guard vcArray.count > nextIndex else { return nil }
        
        //return view of previndex view
        return vcArray[nextIndex]
    }
    
    
    

}
