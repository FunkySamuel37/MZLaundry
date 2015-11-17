//
//  IndexViewController.swift
//  MZLaundry
//
//  Created by Samuel37 on 15/10/16.
//  Copyright © 2015年 Samuel37. All rights reserved.
//

import UIKit
import SnapKit

class IndexViewController: BaseModelView, UIScrollViewDelegate {
  
  @IBOutlet weak var adScrollView: UIScrollView!
  @IBOutlet weak var adPageControl: UIPageControl!
  var screenSize:CGRect = UIScreen.mainScreen().bounds
  var adImageViewArray: [UIImageView]! = []
  let cartSingleton = CartSingleton.sharedInstance

  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    self.setupUI()
    self.loadAdData()
    //设置自动滚动的广告栏
    NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: "scrollImages", userInfo: nil, repeats: true)
    
  }
  
  func scrollImages(){
    
    if self.adScrollView.contentOffset.x == self.adScrollView.contentSize.width - self.screenSize.width  {
      let newPoint = CGPoint(x: 0, y: 0)
      self.adScrollView.setContentOffset(newPoint, animated: true)
    } else {
      let newPoint = CGPoint(x: self.adScrollView.contentOffset.x + self.screenSize.width, y: 0)
      self.adScrollView.setContentOffset(newPoint, animated: true)
    }
    
  }
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  
  /*
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  // Get the new view controller using segue.destinationViewController.
  // Pass the selected object to the new view controller.
  }
  */
  
  
  
  
  func setupUI(){
    self.adScrollView.clipsToBounds = true
    self.adScrollView.showsHorizontalScrollIndicator = false
    self.adScrollView.showsVerticalScrollIndicator = false
    self.adScrollView.bounces = false
    self.adScrollView.pagingEnabled = true
    self.adScrollView.delegate = self
  }
  
  //滚动图片的创建
  private func createImageView(urls: [String]){
    
    //修改scrollview的contentsize
    self.adScrollView.contentSize = CGSize(width: self.screenSize.width * CGFloat(urls.count), height: adScrollView.frame.height)
    //创建ImageView
    for i in 0..<urls.count {
      let imageView = UIImageView(frame: CGRect(x: CGFloat(i) * self.screenSize.width, y: 0, width: self.screenSize.width, height: self.adScrollView.frame.height))
      self.adScrollView.addSubview(imageView)
      
      //加载图片
      imageView.startLoader()
      imageView.sd_setImageWithURL(NSURL(string: urls[i]), placeholderImage: nil, options: [.CacheMemoryOnly, .RefreshCached], progress: { (r, t) -> Void in
        imageView.updateImageDownloadProgress(CGFloat(r)/CGFloat(t))
        }, completed: { (_, e, _, _) -> Void in
          if e == nil {
            imageView.reveal()
          }
      })
    }
  }
  
  func loadAdData(){
      HttpTool.sharedInstance.getAdInfo { (urls) -> Void in
      self.createImageView(urls)
    }
    
  }
  
  func scrollViewDidScroll(scrollView: UIScrollView) {
    //fabs()绝对值
    self.adPageControl.currentPage = Int(fabs(scrollView.contentOffset.x / scrollView.frame.width))
  }
  
}


//MARK: - Action functions
extension IndexViewController{
  @IBAction func packageLaundry(sender: AnyObject) {
    let type = PopViewType(name: "袋洗",price: "68", desc: "装多少，洗多少！\n\n亲，皮衣、真丝内衣、袜子、鞋不要装哦！", image: "3-6-0")
    
    let popView = YZPopupView.show(type)
    popView.delegate = self
  }
  
  @IBAction func itemLaundry(sender: UIButton) {
    
    let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("LaundryItemController")
    vc.transitioningDelegate = self
    vc.modalPresentationStyle = UIModalPresentationStyle.Custom
    
    self.presentViewController(vc, animated: true) { () -> Void in
      
    }
  }
}

extension IndexViewController:AddToCartDelegate{
  func addToCart(item:PopViewType,count:Int) {
    self.cartSingleton.storeCartInfo(item, count: count)
    
    print(cartSingleton.cartItemArray.count)
  }
}
