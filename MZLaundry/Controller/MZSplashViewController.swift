//
//  ViewController.swift
//  MZLaundry
//
//  Created by Samuel37 on 15/10/8.
//  Copyright © 2015年 Samuel37. All rights reserved.
//

import UIKit

class MZSplashViewController: UIViewController, UIScrollViewDelegate {

    let screenSize:CGRect = UIScreen.mainScreen().bounds
    var imageArr = ["0-引-1","0-引-2","0-引-3"]
    var myScrollView:UIScrollView!
    var pageControl:UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        self.setupViews()
        
//        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "scrollImages", userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    func scrollImages(){
//        
//        if self.myScrollView.contentOffset.x == self.screenSize.width * 2 {
//            let newPoint = CGPoint(x: 0, y: 0)
//            self.myScrollView.setContentOffset(newPoint, animated: true)
//        } else {
//            let newPoint = CGPoint(x: self.myScrollView.contentOffset.x + self.screenSize.width, y: 0)
//            self.myScrollView.setContentOffset(newPoint, animated: true)
//        }
//        
//    }
    
    func setupViews(){
        //scrollView
        self.myScrollView = UIScrollView(frame: screenSize)
        myScrollView.contentSize = CGSize(width: CGFloat(imageArr.count) * self.screenSize.width, height: screenSize.height)
        for i in 0..<self.imageArr.count {
            let imageView = UIImageView(frame: CGRect(x: self.screenSize.width * CGFloat(i), y: 0, width: self.screenSize.width, height: self.screenSize.height))
            imageView.image = UIImage(named: self.imageArr[i])
            myScrollView.addSubview(imageView)
        }
        
        myScrollView.showsHorizontalScrollIndicator = false
        myScrollView.showsVerticalScrollIndicator = false
        
        myScrollView.pagingEnabled = true
        self.view.addSubview(myScrollView)
        myScrollView.delegate = self
        
        //pageControl
        pageControl = UIPageControl(frame: CGRect(x: (screenSize.width-150)/2, y: screenSize.height-150, width: 150, height: 40))
        pageControl.numberOfPages = self.imageArr.count
        pageControl.currentPage = 0
        self.view.addSubview(pageControl)
        
        //buttom
        let button = UIButton(frame: CGRect(x: (screenSize.width-150)/2, y: screenSize.height-85, width: 150, height: 35))
        button.setImage(UIImage(named: "0-1-1"), forState: UIControlState.Normal)
        self.view.addSubview(button)
        button.addTarget(self, action: "goLoginView", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        self.view.backgroundColor = UIColor.whiteColor()

    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        self.pageControl.currentPage = Int(scrollView.contentOffset.x / self.screenSize.width)

    }
}

extension MZSplashViewController {
    func goLoginView(){
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("loginViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

