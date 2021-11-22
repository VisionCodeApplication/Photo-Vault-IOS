//
//  selectphotoVC.swift
//  Gallery Lockup
//
//  Created by iMac on 13/11/21.
//

import UIKit
import AssetsLibrary
import Photos
import GoogleMobileAds
import Firebase

class selectphotoVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var photos: PHFetchResult<PHAsset>!
    var assetCollection: PHAssetCollection!
    var asset: PHAsset!
    
    var DBvalue = Int()
    
    var ary = [String]()
    var folderimgary = [[String]]()
    var foldercount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stringload()
        getAssetFromPhoto()
        LaunchInterstitialAd()
    }
    override func viewWillAppear(_ animated: Bool) {
        let database = Database.database().reference()
        
        database.child("hidedata").observe(.value) { snapshot in
            print(snapshot.value!)
            self.DBvalue = snapshot.value as! Int
            if(self.DBvalue == 1){
               // self.Launchbannerad()
            }
        }
        LaunchInterstitialAd()
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
    
    
    func stringload() {
        let user = UserDefaults.standard
        if user.value(forKey: "folderimgary") != nil {
            folderimgary = user.value(forKey: "folderimgary") as! [[String]]
        }
        foldercount = user.value(forKey: "foldercount") as! Int
        print(foldercount)
    }
    
    func getAssetFromPhoto() {
        let options = PHFetchOptions()
        options.sortDescriptors = [ NSSortDescriptor(key: "creationDate", ascending: true) ]
        options.predicate = NSPredicate(format: "mediaType = %d", PHAssetMediaType.image.rawValue)
   //    options.includeHiddenAssets = true
        photos = PHAsset.fetchAssets(with: options)
        print(photos)
    }
    @IBAction func Backbtnclick(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "selectphotocell", for: indexPath) as! selectphotocell
        cell.photoimg.layer.cornerRadius = 5
        asset = photos!.object(at: indexPath.row)
        let width: CGFloat = 400
            let height: CGFloat = 400
            let size = CGSize(width:width, height:height)
        PHImageManager.default().requestImage(for: asset, targetSize: size, contentMode: PHImageContentMode.aspectFill, options: nil) { (image, userInfo) -> Void in
            cell.photoimg.image = image
            }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        asset = photos!.object(at: indexPath.row)
        let width: CGFloat = 374
            let height: CGFloat = 633
            let size = CGSize(width:width, height:height)
        PHPhotoLibrary.shared().performChanges({
            let request = PHAssetChangeRequest(for: self.asset)
            request.isHidden = !self.asset.isHidden
        }, completionHandler: { success, error in
            if success {
                var str = self.asset.localIdentifier
                print(self.folderimgary[self.foldercount])
                print(self.foldercount)
                self.folderimgary[self.foldercount].append(str)
                print(self.asset.localIdentifier)
                let u = UserDefaults.standard
                u.setValue(self.folderimgary, forKey: "folderimgary")
                PHImageManager.default().requestImage(for: self.asset, targetSize: size, contentMode: PHImageContentMode.aspectFill, options: nil) { (image, userInfo) -> Void in
                    }
               if(self.DBvalue == 1){
                    self.showInterstitialAd()
                }
            } else {
                print("can't set hidden: \(String(describing: error))")
            }
        })
    }
}
