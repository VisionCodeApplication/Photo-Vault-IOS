//
//  HomeVC.swift
//  Gallery Lockup
//
//  Created by iMac on 13/11/21.
//

import UIKit
import GoogleMobileAds
import Firebase

class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    @IBOutlet var creatimg: UIImageView!
    @IBOutlet var Creattxt: UITextField!
    @IBOutlet var Noodataimg: UIImageView!
    @IBOutlet var FolderCollection: UICollectionView!
    @IBOutlet var Blurview: UIView!
    @IBOutlet var Menutblview: UITableView!
    @IBOutlet var Menuview: UIView!
    @IBOutlet var Mainview: UIView!
    @IBOutlet var Createview: UIView!
    @IBOutlet var creatsubview: UIView!
    @IBOutlet var Creatbtn: UIButton!
    @IBOutlet var DEletbtn: UIButton!
    @IBOutlet var creatviewlbl: UILabel!
    
    var folderary = [String]()
    var foldercount = 0
    var folderimgary = [[String]]()
    var foldervideoary = [[String]]()
    
    var DBvalue = Int()
    
    var menuarry = ["Home", "Setting", "Rate", "Share", "More", "About us"]
    var menuimg = ["Home","setting","Rate","share","more","info"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Creattxt.delegate = self
        
        Blurview.isHidden = true
        Mainview.layer.cornerRadius = 30
        creatsubview.layer.cornerRadius = 10
        Folderorimg()
        navigationController?.navigationBar.isHidden = true
        Menuview.isHidden = true
        Createview.isHidden = true
        var tap = UITapGestureRecognizer(target: self, action: #selector(tapfunc))
        Mainview.addGestureRecognizer(tap)
        LaunchInterstitialAd()
        
    }
    override func viewWillAppear(_ animated: Bool) {
       let database = Database.database().reference()
        
        database.child("hidedata").observe(.value) { snapshot in
            print(snapshot.value!)
            self.DBvalue = snapshot.value as! Int
            if(self.DBvalue == 1){
                //self.Launchbannerad()
            }
        }
        LaunchInterstitialAd()
        Folderorimg()
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
    private func LaunchInterstitialAd() {
        let request = GADRequest()
        GADInterstitialAd.load(withAdUnitID: instrsitialad,
                                        request: request,
                              completionHandler: { [self] ad, error in
                                if let error = error {
                                  print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                                  return
                                }
                                interstitial = ad
                              })
    }

    private func showInterstitialAd() {
        if interstitial != nil {
            interstitial.present(fromRootViewController: self)
            LaunchInterstitialAd()
        }
    }
    
    func Folderorimg(){
        let user = UserDefaults.standard
        if user.value(forKey: "folder") != nil {
            folderary = user.value(forKey: "folder") as! [String]
        }
        if user.value(forKey: "folderimgary") != nil {
            folderimgary = user.value(forKey: "folderimgary") as! [[String]]
        }
        if user.value(forKey: "foldervideoary") != nil {
            foldervideoary = user.value(forKey: "foldervideoary") as! [[String]]
        }
        if folderary.count != 0 {
            FolderCollection.isHidden = false
            print(folderary.count)
            Noodataimg.isHidden = true
        }else{
            FolderCollection.isHidden = true
            Noodataimg.isHidden = false
        }
    }
    
    @objc func tapfunc(){
        Menuview.isHidden = true
    }
    
    @objc func longpressfunction(longview : MyLongGesture){
        Blurview.isHidden = false
        Createview.isHidden = false
        DEletbtn.isHidden = false
        Creatbtn.isHidden = true
        Creattxt.isHidden = true
        creatimg.image = UIImage(named: "Deletefolderimg")
        foldercount = longview.index
        
    }
    
    @objc func tappfunc(viewcontent : MyTapGesture){
        print(viewcontent.indexValue)
        let nxt = storyboard?.instantiateViewController(withIdentifier: "HideimgsVC") as! HideimgsVC
        var FC = UserDefaults.standard
        FC.setValue(viewcontent.indexValue, forKey: "foldercount")
        navigationController?.pushViewController(nxt, animated: true)
    }
    
    @IBAction func Menubtnclick(_ sender: UIButton) {
        Menuview.isHidden = false
    }
    @IBAction func Creatbtnclick(_ sender: Any) {
        creatviewlbl.text = "Do you want to create new folder?"
        if Creattxt.text != "" {
            folderary.append(Creattxt.text!)
            let use = UserDefaults.standard
            use.setValue(folderary, forKey: "folder")
            folderimgary.append([])
            use.setValue(folderimgary, forKey: "folderimgary")
            foldervideoary.append([])
            use.setValue(foldervideoary, forKey: "foldervideoary")
            print(foldervideoary.count)
            FolderCollection.reloadData()
            Folderorimg()
            if(self.DBvalue == 1){
                showInterstitialAd()
            }
            Creattxt.text = ""
        }
        Blurview.isHidden = true
        Createview.isHidden = true
        if DBvalue == 1 {
            showInterstitialAd()
        }
    }
    
    @IBAction func Deletbtnclick(_ sender: Any) {
        creatviewlbl.text = "Do you want to Delete this folder?"
            folderary.remove(at: foldercount)
            let use = UserDefaults.standard
            use.setValue(folderary, forKey: "folder")
            folderimgary.remove(at: foldercount)
            use.setValue(folderimgary, forKey: "folderimgary")
            foldervideoary.remove(at: foldercount)
            use.setValue(foldervideoary, forKey: "foldervideoary")
            FolderCollection.reloadData()
            Folderorimg()
        
        Blurview.isHidden = true
        Createview.isHidden = true
        
    }
    
    
    @IBAction func Cancelbtnclick(_ sender: Any) {
        Blurview.isHidden = true
        Createview.isHidden = true
    }
    
    @IBAction func Addbtnclick(_ sender: Any) {
        Blurview.isHidden = false
        Createview.isHidden = false
        DEletbtn.isHidden = true
        Creatbtn.isHidden = false
        Creattxt.isHidden = false
        creatimg.image = UIImage(named: "creatviimg")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuarry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Menucell") as! Menucell
        cell.img.image = UIImage(named: menuimg[indexPath.row])
        cell.lbl.text = menuarry[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Menuview.isHidden = true
        switch indexPath.row {
        case 0:
            break
        case 1:
            var nxt = storyboard?.instantiateViewController(withIdentifier: "SettingVC") as! SettingVC
            navigationController?.pushViewController(nxt, animated: true)
            break
        case 2:
            let url = URL(string: RateAppID)
            UIApplication.shared.open(url!, options: [:] , completionHandler: nil)
            break
        case 3:
            let url = URL(string: ShareAppID)
            UIApplication.shared.open(url!, options: [:] , completionHandler: nil)
            break
        case 4:
            let url = URL(string: MoreAppID)
            UIApplication.shared.open(url!, options: [:] , completionHandler: nil)
            break
        case 5:
            let url = URL(string: ShareAppID)
            UIApplication.shared.open(url!, options: [:] , completionHandler: nil)
            break
        default:
            let url = URL(string: AboutUsID)
            UIApplication.shared.open(url!, options: [:] , completionHandler: nil)
            break
        }
    }
    
}
extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return folderary.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FolderCC", for: indexPath) as! FolderCC
        cell.layer.cornerRadius = 10
        cell.isUserInteractionEnabled = true
        cell.contentView.isUserInteractionEnabled = true
        var long = MyLongGesture(target: self, action: #selector(longpressfunction))
        long.index = indexPath.row
        cell.addGestureRecognizer(long)
        var tapp = MyTapGesture.init(target: self, action: #selector(tappfunc))
        tapp.indexValue = indexPath.row
        cell.addGestureRecognizer(tapp)
        cell.Folderimg.image = UIImage(named: "Folder")
        cell.lbl.text = folderary[indexPath.row]
        return cell
    }
 /*   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var tap = UILongPressGestureRecognizer(target: self, action: #selector(longpressfunction))
        collectionView.cellForItem(at: indexPath)?.addGestureRecognizer(tap)

        let nxt = storyboard?.instantiateViewController(withIdentifier: "HideimgsVC") as! HideimgsVC
        var FC = UserDefaults.standard
        FC.setValue(indexPath.row, forKey: "foldercount")
        navigationController?.pushViewController(nxt, animated: true)
        
        foldercount = indexPath.row
    }*/
}
class MyTapGesture: UITapGestureRecognizer {
    var indexValue = 0
}
class MyLongGesture: UILongPressGestureRecognizer{
    var index = 0
}
