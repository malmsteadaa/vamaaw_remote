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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "gymCell") as! UserTableViewCell
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return 4
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 0:
            return "How was your Gym experience?"
        case 1:
            return "Was there a variety of equipment?"
        case 2:
            return "How did the staff treat you?"
        case 3:
            return "Was the equpiment clean?"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            switch indexPath.item {
            case 0 :
                return print("happy")
            case 1:
                return print("ok")
            case 2:
                return print("bad")
            default:
                return print("")
            }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

