//
//  ChangePassViewController.swift
//  vamaaw
//
//  Created by admin on 2/28/22.
//

import UIKit

class ChangePassViewController: UIViewController {

    @IBOutlet weak var CPass: UITextField!
    @IBOutlet weak var Npass: UITextField!
    var ID:String?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func update(_ sender: Any) {
        if(CPass==Npass){
    let q1:[String:Any] = [kSecClass as String: kSecClassGenericPassword, kSecAttrAccount as String : ID!]
    let att1 : [String:Any] = [kSecValueData as String : CPass.text!.data(using: .utf8)!]
    if SecItemUpdate(q1 as CFDictionary, att1 as CFDictionary) == noErr{
        print("It was updated")
    }else{
        print("It wasn't updated")
    }
        }else{
            print("Password Mixup")
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
}
