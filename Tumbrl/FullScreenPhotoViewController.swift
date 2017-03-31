//
//  FullScreenPhotoViewController.swift
//  Tumbrl
//
//  Created by Arthur Burgin on 3/30/17.
//  Copyright © 2017 Laura. All rights reserved.
//

import UIKit

class FullScreenPhotoViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet var zoomPhotoView: UIImageView!
    var image:UIImage?
    
    @IBOutlet var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.delegate = self
        zoomPhotoView.image = image
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return zoomPhotoView
    }

    @IBAction func closeVC(_ sender: Any) {
        dismiss(animated: true, completion: {})
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
