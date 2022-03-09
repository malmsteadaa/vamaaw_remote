//
//  ViewController.swift
//  vamaaw
//
//  Created by admin on 2/24/22.
//
//rger
//you all ready for this ?
import UIKit

class FoodViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //placeholder faces
    var imgData = ["img","midimg","sadimg"]
    var foodTotal = 0
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "foodCell") as! UserTableViewCell
        
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
            return "How was the food?"
        case 1:
            return "Was the food prepared in a timely manner?"
        case 2:
            return "How did the staff treat you?"
        case 3:
            return "How clean were the utensils?"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                switch indexPath.item {
                case 0 :
                    foodTotal = 3 + foodTotal
                    return print(foodTotal)
                case 1:
                    foodTotal = 1 + foodTotal
                    return print(foodTotal)
                case 2:
                    foodTotal = 0 + foodTotal
                    return print(foodTotal)
                default:
                    return print(foodTotal)
                }
    }
    var result : Int!
    
    @IBAction func submitReview(_ sender: Any) {
        result = foodTotal
        if foodTotal <= 6 {
            performSegue(withIdentifier: "gotobadReview", sender: self)
            foodTotal = 0
        }
        else{
            performSegue(withIdentifier: "gotogoodReview", sender: self)
            foodTotal = 0
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

