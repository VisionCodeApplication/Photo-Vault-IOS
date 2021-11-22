//
//  SettingVC.swift
//  Gallery Lockup
//
//  Created by iMac on 15/11/21.
//

import UIKit
import GoogleMobileAds
import Firebase

class SettingVC: UIViewController {

    @IBOutlet var Mainview: UIView!
    @IBOutlet var Subview: UIView!
    
    var DBvalue = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Subview.layer.cornerRadius = 20
        let database = Database.database().reference()
        
        database.child("hidedata").observe(.value) { snapshot in
            print(snapshot.value!)
            self.DBvalue = snapshot.value as! Int
            if(self.DBvalue == 1){
              //  self.Launchbannerad()
            }
        }
    }
    
    
    func Launchbannerad(){
        baneer = GADBannerView(adSize: kGADAdSizeBanner)
        baneer.adUnitID = Bannerad
        baneer.rootViewController = self
        addBannerViewToView(baneer)
        baneer.load(GADRequest())
    }
    func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
        view.addConstraints(
          [NSLayoutConstraint(item: bannerView,
                              attribute: .bottom,
                              relatedBy: .equal,
                              toItem: bottomLayoutGuide,
                              attribute: .top,
                              multiplier: 1,
                              constant: 0),
           NSLayoutConstraint(item: bannerView,
                              attribute: .centerX,
                              relatedBy: .equal,
                              toItem: view,
                              attribute: .centerX,
                              multiplier: 1,
                              constant: 0)
          ])
    }
    
    @IBAction func Petternbtnclick(_ sender: Any) {
        var nxt = storyboard?.instantiateViewController(withIdentifier: "PatternVC") as! PatternVC
        navigationController?.pushViewController(nxt, animated: true)
    }
    
    @IBAction func Numberbtnclick(_ sender: Any) {
        var nxt = storyboard?.instantiateViewController(withIdentifier: "LockScreenVC") as! LockScreenVC
        navigationController?.pushViewController(nxt, animated: true)
    }
    @IBAction func Backbtnclick(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
