//
//  PhotosViewController.swift
//  Tumbrl
//
//  Created by Laura on 3/29/17.
//  Copyright © 2017 Laura. All rights reserved.
//

import UIKit
import AFNetworking

class PhotosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var posts: [NSDictionary]?
    
    
    @IBOutlet var tableView: UITableView!

    
    var image:UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 320
        
        let apiKey = "Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV"
        let url = URL(string:"https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=\(apiKey)")
        let request = URLRequest(url: url!)
        let session = URLSession(
            configuration: URLSessionConfiguration.default,
            delegate:nil,
            delegateQueue:OperationQueue.main
        )
        
        let task : URLSessionDataTask = session.dataTask(with: request,completionHandler: { (dataOrNil, response, error) in
            if let data = dataOrNil {
                if let responseDictionary = try! JSONSerialization.jsonObject(with: data, options:[]) as? NSDictionary {
                    //NSLog("response: \(responseDictionary)")
                    let response = responseDictionary["response"] as! NSDictionary
                    self.posts = response["posts"] as! [NSDictionary]
                    self.tableView.reloadData()
                    //print(self.posts)
                }
            }
        });
        task.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        if let postArr = posts{
            
            return postArr.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        
        let post = posts?[indexPath.row]
        
        if let photos = post?.value(forKeyPath: "photos") as? [NSDictionary] {
            // photos is NOT nil, go ahead and access element 0 and run the code in the curly braces
            let imageUrlString = photos[0].value(forKeyPath: "original_size.url") as? String
            
            if let imageUrl = URL(string: imageUrlString!) {
                // URL(string: imageUrlString!) is NOT nil, go ahead and unwrap it and assign it to imageUrl and run the code in the curly braces
                cell.userPhoto.setImageWith(imageUrl)
                image = cell.userPhoto.image
            } else {
                // URL(string: imageUrlString!) is nil. Good thing we didn't try to unwrap it!
                
            }
            
        } else {
            // photos is nil. Good thing we didn't try to unwrap it!
            
        }
        return cell
        
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let vc = segue.destination as! PhotosDetailViewController
        vc.image = image
        
        let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
    }
    
    
}
