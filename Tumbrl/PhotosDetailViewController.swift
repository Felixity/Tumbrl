//
//  PhotosDetailViewController.swift
//  Tumbrl
//
//  Created by Arthur Burgin on 3/29/17.
//  Copyright © 2017 Laura. All rights reserved.
//

import UIKit

class PhotosDetailViewController: UIViewController {
    
    var image: UIImage?
    var photoURL: String?
    
    @IBOutlet var userImage: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        userImage.image = image
        userImage.isUserInteractionEnabled = true
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapPhoto(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "ZoomPhoto", sender: sender)
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let vc = segue.destination as! FullScreenPhotoViewController
        vc.image = image
    }
    
}
