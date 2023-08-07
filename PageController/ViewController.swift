//
//  ViewController.swift
//  PageController
//
//  Created by Ananth Nair on 04/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var pageControllerSwipe: UIPageControl!
    var array  =  ["Firstpage","SecondPage","ThirdPage"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControllerSwipe.currentPage = 0
        
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.responseToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        swipeRight.view?.backgroundColor = .brown
        self.view.addGestureRecognizer(swipeRight)
        
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.responseToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        swipeLeft.view?.backgroundColor = .green
        self.view.addGestureRecognizer(swipeLeft)
        
        
        
        if pageControllerSwipe.currentPage == 0 {
            textLabel.text = array[0]
        } else if pageControllerSwipe.currentPage == 1 {
            textLabel.text = array[1]
        }  else if pageControllerSwipe.currentPage == 2  {
            textLabel.text = array[2]
        }
    }
    
    
    @objc func responseToSwipeGesture(gesture: UIGestureRecognizer){
        
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            if swipeGesture.direction == UISwipeGestureRecognizer.Direction.right {
                pageControllerSwipe.currentPage = pageControllerSwipe.currentPage - 1
                textLabel.text = array[pageControllerSwipe.currentPage]
                
            }  else  if  swipeGesture.direction == UISwipeGestureRecognizer.Direction.left {
                if pageControllerSwipe.numberOfPages > pageControllerSwipe.currentPage {
                    pageControllerSwipe.currentPage = pageControllerSwipe.currentPage + 1
                    textLabel.text = array[pageControllerSwipe.currentPage]
                    
                }
            }
            
            
        }
        
        
    }
    
}

