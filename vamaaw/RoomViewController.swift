//
//  ViewController.swift
//  vamaaw
//
//  Created by admin on 2/24/22.
//
//rger
//you all ready for this ?
import UIKit

class RoomViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //placeholder faces
    var imgData = ["img","midimg","sadimg"]
    var roomTotal = 0
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "roomCell") as! UserTableViewCell
        
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
            return "How was your Room?"
        case 1:
            return "Was there enough space in your room?"
        case 2:
            return "How did the staff treat you?"
        case 3:
            return "Was the room cleaned in a timely manner?"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.item {
        case 0 :
            roomTotal = 3 + roomTotal
            return print(roomTotal)
        case 1:
            roomTotal = 1 + roomTotal
            return print(roomTotal)
        case 2:
            roomTotal = 0 + roomTotal
            return print(roomTotal)
        default:
            return print(roomTotal)
        }
    }
    var result : Int!
    @IBAction func submitReview(_ sender: Any) {
        result = roomTotal
        if roomTotal <= 6 {
            performSegue(withIdentifier: "gotobadReview", sender: self)
            roomTotal = 0
        }
        else{
            performSegue(withIdentifier: "gotogoodReview", sender: self)
            roomTotal = 0
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


