//
//  sumViewController.swift
//  vamaaw
//
//  Created by admin on 3/14/22.
//

import UIKit

class sumViewController: UIViewController {

    @IBOutlet weak var n: UILabel!
    @IBOutlet weak var r: UILabel!
    var us: TheUser = LoginViewController.UserName!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton=true
        print("print to get user", us.wrappedname)
        sum()
        n.text=String(us.reviewsArray.count)
        // Do any additional setup after loading the view.
    }
    func sum(){
        var sum=0.0
        for rev: TheReviews in us.reviewsArray{
            sum+=Double(rev.rating)
        }
        print(sum,"and", us.reviewsArray.count)
        r.text = String(sum/Double(us.reviewsArray.count)) 
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
