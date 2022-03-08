//
//  ViewController.swift
//  vamaaw
//
//  Created by admin on 2/24/22.
//
//rger
//you all ready for this ?
import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //placeholder faces
    var imgData = ["img","midimg","sadimg"]
    var gymTotal = 0
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "gymCell") as! UserTableViewCell
        
        switch indexPath.section{
        case 0:
            cell.face.image = UIImage(named: imgData[indexPath.row])
            return cell
        case 1:
            cell.face.image = UIImage(named: imgData[indexPath.row])
            return cell
        case 2:
            cell.face.image = UIImage(named: imgData[indexPath.row])
            return cell
        case 3:
            cell.face.image = UIImage(named: imgData[indexPath.row])
            return cell
        default:
            return cell
        }
        
    
        
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
                gymTotal = 3 + gymTotal
                return print(gymTotal)
            case 1:
                gymTotal = 1 + gymTotal
                return print(gymTotal)
            case 2:
                gymTotal = 0 + gymTotal
                return print(gymTotal)
            default:
                return print(gymTotal)
            }
    }
    
    @IBOutlet weak var submit: UIButton!
    
    @IBOutlet weak var reviewimg: UIImageView!
    
    @IBOutlet weak var reviewtf: UILabel!
    
    var result : Int!
    @IBAction func submitAction(_ sender: Any) {
        result = gymTotal
        if gymTotal <= 6 {
            performSegue(withIdentifier: "gotobadReview", sender: self)
        }
        else{
            performSegue(withIdentifier: "gotogoodReview", sender: self)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }


}

