//
//  thankYouViewController.swift
//  vamaaw
//
//  Created by admin on 3/13/22.
//

import UIKit

class thankYouViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    var avg:Int?
    func sum(){
        let ar = LoginViewController.UserName?.reviewsArray
        var sum=0
        for T in ar!{
            sum += Int(T.rating)
        }
        self.avg=sum/ar!.count
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
