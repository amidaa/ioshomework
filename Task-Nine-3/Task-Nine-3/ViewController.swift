//
//  ViewController.swift
//  Task-Nine-3
//
//  Created by student on 2018/11/22.
//  Copyright © 2018年 zhangfeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControlView: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.minimumZoomScale = 0.2
        scrollView.maximumZoomScale = 2
        scrollView.delegate = self
        for i in 1...8{
            let imageView = UIImageView(image: UIImage(named: "timg-"+String(i)))
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRect(x: CGFloat(i-1)*scrollView.bounds.width, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
            scrollView.addSubview(imageView)
        }
        scrollView.contentSize = CGSize(width: scrollView.bounds.width * 8, height: scrollView.bounds.height)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        pageControlView.numberOfPages = 8
        pageControlView.currentPage = 0
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func pageControllClick(_ sender: UIPageControl) {
        let currentpage = sender.currentPage
        let rect = CGRect(x: CGFloat(currentpage)*scrollView.bounds.width, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
        scrollView.scrollRectToVisible(rect, animated: true)
    }
    func scrollViewDidEndDecelerating(_ scrollView:UIScrollView) {
        let currentPage = scrollView.contentOffset.x/scrollView.bounds.width
        pageControlView.currentPage = Int(currentPage)
    }
    
}

