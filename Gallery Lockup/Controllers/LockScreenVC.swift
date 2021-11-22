//
//  LockScreenVC.swift
//  Gallery Lockup
//
//  Created by iMac on 13/11/21.
//

import UIKit

class LockScreenVC: UIViewController{

    @IBOutlet var lbl: UILabel!
    @IBOutlet var lbl1: UITextField!
    @IBOutlet var lbl2: UITextField!
    @IBOutlet var lbl3: UITextField!
    @IBOutlet var lbl4: UITextField!
    var tagcount = 1
    var Passtxt = String()
    var pass = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl.text = "set password"
        tagcount = 1
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btn1click(_ sender: Any) {
        Passtxt.append("1")
        switch tagcount {
        case lbl1.tag:
            lbl1.isSecureTextEntry = true
            lbl1.text = "1"
            tagcount += 1
            break
        case lbl2.tag:
            lbl2.isSecureTextEntry = true
            lbl2.text = "1"
            tagcount += 1
            break
        case lbl3.tag:
            lbl3.isSecureTextEntry = true
            lbl3.text = "1"
            tagcount += 1
            break
        case lbl4.tag:
            lbl4.isSecureTextEntry = true
            lbl4.text = "1"
            passwordcheck()
            break
        default:
            break
        }
       
    }
    @IBAction func btn2click(_ sender: Any) {
        Passtxt.append("2")
        switch tagcount {
        case lbl1.tag:
            lbl1.isSecureTextEntry = true
            lbl1.text = "2"
            tagcount += 1
            break
        case lbl2.tag:
            lbl2.isSecureTextEntry = true
            lbl2.text = "2"
            tagcount += 1
            break
        case lbl3.tag:
            lbl3.isSecureTextEntry = true
            lbl3.text = "2"
            tagcount += 1
            break
        case lbl4.tag:
            lbl4.isSecureTextEntry = true
            lbl4.text = "2"
            passwordcheck()
            break
        default:
            break
        }
        
    }
    @IBAction func btn3click(_ sender: Any) {
        Passtxt.append("3")
        switch tagcount {
        case lbl1.tag:
            lbl1.isSecureTextEntry = true
            lbl1.text = "3"
            tagcount += 1
            break
        case lbl2.tag:
            lbl2.isSecureTextEntry = true
            lbl2.text = "3"
            tagcount += 1
            break
        case lbl3.tag:
            lbl3.isSecureTextEntry = true
            lbl3.text = "3"
            tagcount += 1
            break
        case lbl4.tag:
            lbl4.isSecureTextEntry = true
            lbl4.text = "3"
            passwordcheck()
            break
        default:
            break
        }
        
    }
    @IBAction func btn4click(_ sender: Any) {
        Passtxt.append("4")
        switch tagcount {
        case lbl1.tag:
            lbl1.isSecureTextEntry = true
            lbl1.text = "4"
            tagcount += 1
            break
        case lbl2.tag:
            lbl2.isSecureTextEntry = true
            lbl2.text = "4"
            tagcount += 1
            break
        case lbl3.tag:
            lbl3.isSecureTextEntry = true
            lbl3.text = "4"
            tagcount += 1
            break
        case lbl4.tag:
            lbl4.isSecureTextEntry = true
            lbl4.text = "4"
            passwordcheck()
            break
        default:
            break
        }
    }
    @IBAction func btn5click(_ sender: Any) {
        Passtxt.append("5")
        switch tagcount {
        case lbl1.tag:
            lbl1.isSecureTextEntry = true
            lbl1.text = "5"
            tagcount += 1
            break
        case lbl2.tag:
            lbl2.isSecureTextEntry = true
            lbl2.text = "5"
            tagcount += 1
            break
        case lbl3.tag:
            lbl3.isSecureTextEntry = true
            lbl3.text = "5"
            tagcount += 1
            break
        case lbl4.tag:
            lbl4.isSecureTextEntry = true
            lbl4.text = "5"
            passwordcheck()
            break
        default:
            break
        }
    }
    @IBAction func btn6click(_ sender: Any) {
        Passtxt.append("6")
        switch tagcount {
        case lbl1.tag:
            lbl1.isSecureTextEntry = true
            lbl1.text = "6"
            tagcount += 1
            break
        case lbl2.tag:
            lbl2.isSecureTextEntry = true
            lbl2.text = "6"
            tagcount += 1
            break
        case lbl3.tag:
            lbl3.isSecureTextEntry = true
            lbl3.text = "6"
            tagcount += 1
            break
        case lbl4.tag:
            lbl4.isSecureTextEntry = true
            lbl4.text = "6"
            passwordcheck()
            break
        default:
            break
        }
    }
    @IBAction func btn7click(_ sender: Any) {
        Passtxt.append("7")
        switch tagcount {
        case lbl1.tag:
            lbl1.isSecureTextEntry = true
            lbl1.text = "7"
            tagcount += 1
            break
        case lbl2.tag:
            lbl2.isSecureTextEntry = true
            lbl2.text = "7"
            tagcount += 1
            break
        case lbl3.tag:
            lbl3.isSecureTextEntry = true
            lbl3.text = "7"
            tagcount += 1
            break
        case lbl4.tag:
            lbl4.isSecureTextEntry = true
            lbl4.text = "7"
            passwordcheck()
            break
        default:
            break
        }
    }
    @IBAction func btn8click(_ sender: Any) {
        Passtxt.append("8")
        switch tagcount {
        case lbl1.tag:
            lbl1.isSecureTextEntry = true
            lbl1.text = "8"
            tagcount += 1
            break
        case lbl2.tag:
            lbl2.isSecureTextEntry = true
            lbl2.text = "8"
            tagcount += 1
            break
        case lbl3.tag:
            lbl3.isSecureTextEntry = true
            lbl3.text = "8"
            tagcount += 1
            break
        case lbl4.tag:
            lbl4.isSecureTextEntry = true
            lbl4.text = "8"
            passwordcheck()
            break
        default:
            break
        }
    }
    @IBAction func btn9click(_ sender: Any) {
        Passtxt.append("9")
        switch tagcount {
        case lbl1.tag:
            lbl1.isSecureTextEntry = true
            lbl1.text = "9"
            tagcount += 1
            break
        case lbl2.tag:
            lbl2.isSecureTextEntry = true
            lbl2.text = "9"
            tagcount += 1
            break
        case lbl3.tag:
            lbl3.isSecureTextEntry = true
            lbl3.text = "9"
            tagcount += 1
            break
        case lbl4.tag:
            lbl4.isSecureTextEntry = true
            lbl4.text = "9"
            passwordcheck()
            break
        default:
            break
        }
    }
    @IBAction func btn0click(_ sender: Any) {
        Passtxt.append("0")
        switch tagcount {
        case lbl1.tag:
            lbl1.isSecureTextEntry = true
            lbl1.text = "0"
            tagcount += 1
            break
        case lbl2.tag:
            lbl2.isSecureTextEntry = true
            lbl2.text = "0"
            tagcount += 1
            break
        case lbl3.tag:
            lbl3.isSecureTextEntry = true
            lbl3.text = "0"
            tagcount += 1
            break
        case lbl4.tag:
            lbl4.isSecureTextEntry = true
            lbl4.text = "0"
            passwordcheck()
            break
        default:
            break
        }
    }
    @IBAction func btnRemoveclick(_ sender: Any) {
        if tagcount != 1 {
            Passtxt.removeLast()
            switch tagcount - 1 {
            case lbl1.tag:
                lbl1.isSecureTextEntry = false
                lbl1.text = "_"
                tagcount -= 1
                break
            case lbl2.tag:
                lbl2.isSecureTextEntry = false
                lbl2.text = "_"
                tagcount -= 1
                break
            case lbl3.tag:
                lbl3.isSecureTextEntry = false
                lbl3.text = "_"
                tagcount -= 1
                break
            case lbl4.tag:
                lbl4.isSecureTextEntry = false
                lbl4.text = "_"
                tagcount -= 1
                break
            default:
                break
            }
        }
    }
    
    @IBAction func Backbtnclick(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    func passwordcheck() {
        if lbl.text == "set password" {
            let user = UserDefaults.standard
            user.setValue(Passtxt, forKey: "passwordset")
            print(user.value(forKey: "passwordset"))
            print("password set")
            lbl.text = "Conform Password"
            Passtxt = ""
            self.lbl1.isSecureTextEntry = false
            self.lbl2.isSecureTextEntry = false
            self.lbl3.isSecureTextEntry = false
            self.lbl4.isSecureTextEntry = false
            lbl1.text = "_"
            lbl2.text = "_"
            lbl3.text = "_"
            lbl4.text = "_"
            tagcount = 1
            }
        else{
            let user = UserDefaults.standard
            if Passtxt == user.value(forKey: "passwordset") as! String {
                pass = true
                user.setValue(pass, forKey: "torf")
                let pas = "number"
                let user = UserDefaults.standard
                user.setValue(pas, forKey: "passtype")
                print("success")
                navigationController?.popViewController(animated: true)
            }else{
                self.lbl1.isSecureTextEntry = false
                self.lbl2.isSecureTextEntry = false
                self.lbl3.isSecureTextEntry = false
                self.lbl4.isSecureTextEntry = false
                lbl.text = "set password"
                Passtxt = ""
                lbl1.text = "_"
                lbl2.text = "_"
                lbl3.text = "_"
                lbl4.text = "_"
                tagcount = 1
            }
        }
    }
}
