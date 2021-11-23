//
//  ViewController.swift
//  Gallery Lockup
//
//  Created by iMac on 12/11/21.
//

import UIKit
import CCGestureLock
import GoogleMobileAds

class ViewController: UIViewController {

    #if swift(>=4.2)
    public typealias UIApplicationLaunchOptionsKey = UIApplication.LaunchOptionsKey
    public func UIEdgeInsetsMake(_ top: CGFloat, _ left: CGFloat, _ bottom: CGFloat, _ right: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }
    #endif
    
    
   
    @IBOutlet var lbl1: UITextField!
    @IBOutlet var lbl2: UITextField!
    @IBOutlet var lbl3: UITextField!
    @IBOutlet var lbl4: UITextField!
    @IBOutlet var Numberview: UIView!
    @IBOutlet var patternview: CCGestureLock!
    @IBOutlet var lblenter: UILabel!
    @IBOutlet var lblview: UIView!
    
    var passtxt = String()
    var pass = String()
    var passwordset = false
    var tagcount = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        tagcount = 1
        navigationController?.navigationBar.isHidden = true
        
        passwordtype()
        let use = UserDefaults.standard
        if use.value(forKey: "torf") != nil {
            passwordset = use.value(forKey: "torf") as! Bool
        }else{
            passwordset = false
        }
        setupGestureLock()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        let use = UserDefaults.standard
        if use.value(forKey: "torf") != nil {
            passwordset = use.value(forKey: "torf") as! Bool
        }else{
            passwordset = false
        }
        password()
        passwordtype()
        tagcount = 1
    }
    
    func passwordtype(){
        let user = UserDefaults.standard
        if user.value(forKey: "passtype") != nil  {
            let type = user.value(forKey: "passtype") as! String
            if type == "number" {
                patternview.isHidden = true
                Numberview.isHidden = false
                lblview.isHidden = false
                lblenter.text = "Enter Passcode"
            }else{
                patternview.isHidden = false
                Numberview.isHidden = true
                lblview.isHidden = true
                lblenter.text = "Draw Pattern"
            }
        }
    }
    
    func password(){
        if passwordset == false {
            var nxt = storyboard?.instantiateViewController(withIdentifier: "LockScreenVC") as! LockScreenVC
            navigationController?.pushViewController(nxt, animated: true)
        } else{
            let user = UserDefaults.standard
            pass = user.value(forKey: "passwordset") as! String
            print(pass)
        }
    }
    
    
    
    @IBAction func btn1click(_ sender: Any) {
        passtxt.append("1")
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
        passtxt.append("2")
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
        passtxt.append("3")
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
        passtxt.append("4")
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
            print(passtxt)
            passwordcheck()
            break
        default:
            break
        }
    }
    @IBAction func btn5click(_ sender: Any) {
        passtxt.append("5")
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
        passtxt.append("6")
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
        passtxt.append("7")
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
        passtxt.append("8")
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
        passtxt.append("9")
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
        passtxt.append("0")
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
    @IBAction func btnremoveclick(_ sender: Any) {
        if tagcount != 1 {
            passtxt.removeLast()
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
    func passwordcheck(){
        if passtxt == pass {
            print("success")
            let nxt = storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
            navigationController?.pushViewController(nxt, animated: true)
        }else{
            let alert = UIAlertController(title: "Error", message: "Your password is incorrect.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default) { UIAlertAction in
                self.lbl1.isSecureTextEntry = false
                self.lbl2.isSecureTextEntry = false
                self.lbl3.isSecureTextEntry = false
                self.lbl4.isSecureTextEntry = false
                self.lbl1.text = "_"
                self.lbl3.text = "_"
                self.lbl4.text = "_"
                self.lbl2.text = "_"
                self.tagcount = 1
                self.passtxt = ""
            }
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        }
    }
    private func setupGestureLock() {
        
        // Set number of sensors
        patternview.lockSize = (3, 3)
        
        // Sensor grid customisations
        if UIDevice.current.model == "iPhone" {
            patternview.edgeInsets = UIEdgeInsetsMake(10, -20, 0, -20)
        }else{
            patternview.edgeInsets = UIEdgeInsetsMake(-20, 20, 50, 20)
        }
        
        // Sensor point customisation (normal)
        patternview.setSensorAppearance(
            type: .inner,
            radius: 5,
            width: 1,
            color: .white,
            forState: .normal
        )
        patternview.setSensorAppearance(
            type: .outer,
            color: .white,
            forState: .normal
        )
        
        // Sensor point customisation (selected)
        patternview.setSensorAppearance(
            type: .inner,
            radius: 3,
            width: 5,
            color: .white,
            forState: .selected
        )
        patternview.setSensorAppearance(
            type: .outer,
            radius: 30,
            width: 5,
            color: .white,
            forState: .selected
        )
        
        // Sensor point customisation (wrong password)
        patternview.setSensorAppearance(
            type: .inner,
            radius: 3,
            width: 5,
            color: .red,
            forState: .error
        )
        patternview.setSensorAppearance(
            type: .outer,
            radius: 30,
            width: 5,
            color: .red,
            forState: .error
        )
        
        // Line connecting sensor points (normal/selected)
        [CCGestureLock.GestureLockState.normal, CCGestureLock.GestureLockState.selected].forEach { (state) in
            patternview.setLineAppearance(
                width: 5.5,
                color: UIColor.white.withAlphaComponent(0.5),
                forState: state
            )
        }
        
        // Line connection sensor points (wrong password)
        patternview.setLineAppearance(
            width: 5.5,
            color: UIColor.red.withAlphaComponent(0.5),
            forState: .error
        )
        
        patternview.addTarget(
            self,
            action: #selector(gestureComplete),
            for: .gestureComplete
        )
    }
    @objc func gestureComplete(gestureLock: CCGestureLock) {
        let user = UserDefaults.standard
        let pt = user.value(forKey: "passpattern") as! [NSNumber]
        print(pt)
        if patternview.lockSequence == pt {
            let nxt = storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
            navigationController?.pushViewController(nxt, animated: true)
        }else{
            gestureLock.gestureLockState = .error
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(0.5 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: {
                gestureLock.gestureLockState = .normal
            })
        }
    }
}

