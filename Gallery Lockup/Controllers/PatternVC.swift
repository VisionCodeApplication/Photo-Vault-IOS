//
//  PatternVC.swift
//  Gallery Lockup
//
//  Created by iMac on 15/11/21.
//

import UIKit
import CCGestureLock

class PatternVC: UIViewController {

    #if swift(>=4.2)
    public typealias UIApplicationLaunchOptionsKey = UIApplication.LaunchOptionsKey
    public func UIEdgeInsetsMake(_ top: CGFloat, _ left: CGFloat, _ bottom: CGFloat, _ right: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }
    #endif
    
    @IBOutlet var lbl: UILabel!
    @IBOutlet var gestureLock: CCGestureLock!
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl.text = "set password"
        setupGestureLock()
        // Do any additional setup after loading the view.
    }
    private enum LockMode {
        case unlocked
        case locked
    }
    private var lockMode : LockMode {
        get {
            return Password.lockSequence == nil ? .unlocked : .locked
        }
    }
    private func setupGestureLock() {
        
        // Set number of sensors
        gestureLock.lockSize = (3, 3)
        
        // Sensor grid customisations
        gestureLock.edgeInsets = UIEdgeInsetsMake(30, 30, 30, 30)
        
        // Sensor point customisation (normal)
        gestureLock.setSensorAppearance(
            type: .inner,
            radius: 5,
            width: 1,
            color: .white,
            forState: .normal
        )
        gestureLock.setSensorAppearance(
            type: .outer,
            color: .white,
            forState: .normal
        )
        
        // Sensor point customisation (selected)
        gestureLock.setSensorAppearance(
            type: .inner,
            radius: 3,
            width: 5,
            color: .white,
            forState: .selected
        )
        gestureLock.setSensorAppearance(
            type: .outer,
            radius: 30,
            width: 5,
            color: .white,
            forState: .selected
        )
        
        // Sensor point customisation (wrong password)
        gestureLock.setSensorAppearance(
            type: .inner,
            radius: 3,
            width: 5,
            color: .red,
            forState: .error
        )
        gestureLock.setSensorAppearance(
            type: .outer,
            radius: 30,
            width: 5,
            color: .red,
            forState: .error
        )
        
        // Line connecting sensor points (normal/selected)
        [CCGestureLock.GestureLockState.normal, CCGestureLock.GestureLockState.selected].forEach { (state) in
            gestureLock.setLineAppearance(
                width: 5.5,
                color: UIColor.white.withAlphaComponent(0.5),
                forState: state
            )
        }
        
        // Line connection sensor points (wrong password)
        gestureLock.setLineAppearance(
            width: 5.5,
            color: UIColor.red.withAlphaComponent(0.5),
            forState: .error
        )
        
        gestureLock.addTarget(
            self,
            action: #selector(gestureComplete),
            for: .gestureComplete
        )
        
    }
    @objc func gestureComplete(gestureLock: CCGestureLock) {
        if lbl.text == "set password" {
            Password.lockSequence = gestureLock.lockSequence
            gestureLock.gestureLockState = .normal
            lbl.text = "Conform password"
        }else{
            if Password.lockSequence! == gestureLock.lockSequence {
                gestureLock.gestureLockState = .normal
                let pas = "pattern"
                let user = UserDefaults.standard
                user.setValue(pas, forKey: "passtype")
                user.setValue(Password.lockSequence, forKey: "passpattern")
                navigationController?.popViewController(animated: true)
//                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(0.5 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: {
//                    gestureLock.gestureLockState = .normal
//                })
            } else {
                lbl.text = "set password"
                gestureLock.gestureLockState = .error
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(0.5 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: {
                    gestureLock.gestureLockState = .normal
                })
            }
        }
        
    }
    
    @IBAction func Backbtnclick(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
}
struct Password {
    
    static let passwordKey = "password"
    
    static var lockSequence : [NSNumber]? {
        get {
            return UserDefaults.standard.array(forKey: passwordKey) as? [NSNumber]
        }
        set (lockSequence) {
            UserDefaults.standard.set(lockSequence, forKey: passwordKey)
        }
    }
}
