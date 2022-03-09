//
//  ViewController.swift
//  vamaaw
//
//  Created by admin on 2/24/22.
//
//rger
//you all ready for this ?
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //placeholder faces
    var imgData = ["img","midimg","sadimg"]
    var foodTotal = 0
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell") as! UserTableViewCell
        return cell
        
        }
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "User Details"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
              
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
