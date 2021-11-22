//
//  HideimgsVC.swift
//  Gallery Lockup
//
//  Created by iMac on 13/11/21.
//

import UIKit
import AssetsLibrary
import Photos
import GoogleMobileAds
import Firebase

class HideimgsVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, PHPhotoLibraryChangeObserver {
    func photoLibraryDidChange(_ changeInstance: PHChange) {
        DispatchQueue.main.sync {
            // Check if there are changes to the asset we're displaying.
            guard let details = changeInstance.changeDetails(for: aset) else { return }
            guard let assetAfterChanges = details.objectAfterChanges as? PHAsset else { return }
            // Get the updated asset.
            aset = assetAfterChanges
            self.getAssetFromPhoto()
            self.getImageinimageview()
            self.photosfoworhide()
        }
    }
    

    @IBOutlet var Worningview: UIView!
    @IBOutlet var warningsubview: UIView!
    @IBOutlet var Blurview: UIView!
    @IBOutlet var Bottomview: UIView!
    @IBOutlet var Nodatafoundimg: UIImageView!
    @IBOutlet var addview: UIView!
    @IBOutlet var collectionview: UICollectionView!
    @IBOutlet var Mainview: UIView!
    
    var imgarry = [UIImage]()
    var videoarry = [UIImage]()
    var btncount = 0
    var imgpicker = UIImagePickerController?.self
    var addcount = 0
    
    var folderimgary = [[String]]()
    var foldervideoary = [[String]]()
    var foldercount = 0
    
    var DBvalue = Int()
    
    var aset: PHAsset!
    var photos: PHFetchResult<PHAsset>!
    var assetCollection: PHAssetCollection!
    var asset: PHAsset!
    var aseetarry = [PHAsset]()
    var hidecount = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btncount = 0
        Bottomview.layer.shadowColor = UIColor.black.cgColor
        Bottomview.layer.shadowOffset = .zero
        Bottomview.layer.shadowOpacity = 2
        addview.isHidden = true
        warningsubview.layer.cornerRadius = 10
        stringload()
        getAssetFromPhoto()
        getImageinimageview()
        photosfoworhide()
        var tap = UITapGestureRecognizer(target: self, action: #selector(tapfunc))
        Blurview.addGestureRecognizer(tap)
        collectionview.reloadData()
        // Do any additional setup after loading the view.
    }
    
    @objc func tapfunc(){
        Blurview.isHidden = true
        Worningview.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        stringload()
        getAssetFromPhoto()
        getImageinimageview()
        photosfoworhide()
       let database = Database.database().reference()
        
        database.child("hidedata").observe(.value) { snapshot in
            print(snapshot.value!)
            self.DBvalue = snapshot.value as! Int
            if(self.DBvalue == 1){
             //   self.Launchbannerad()
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
    
    func stringload() {
        let user = UserDefaults.standard
        if user.value(forKey: "folderimgary") != nil {
            folderimgary = user.value(forKey: "folderimgary") as! [[String]]
        }
        if user.value(forKey: "foldervideoary") != nil {
            foldervideoary = user.value(forKey: "foldervideoary") as! [[String]]
        }
        foldercount = user.value(forKey: "foldercount") as! Int
    }
    
    func photosfoworhide(){
        if btncount == 0 {
            if folderimgary[self.foldercount].count == 0 {
                collectionview.isHidden = true
                Nodatafoundimg.isHidden = false
            }
            else{
                collectionview.isHidden = false
                Nodatafoundimg.isHidden = true
            }
        }else{
            if foldervideoary[self.foldercount].count == 0 {
                collectionview.isHidden = true
                Nodatafoundimg.isHidden = false
            }
            else{
                collectionview.isHidden = false
                Nodatafoundimg.isHidden = true
            }
        }
    }
    
    func getAssetFromPhoto() {
        if btncount == 0 {
            let options = PHFetchOptions()
            options.sortDescriptors = [ NSSortDescriptor(key: "creationDate", ascending: true) ]
            options.predicate = NSPredicate(format: "mediaType = %d", PHAssetMediaType.image.rawValue)
            options.includeHiddenAssets = true
            photos = PHAsset.fetchAssets(with: options)
            print(photos)
            print(photos.object(at: 0).isHidden)
        }else{
            let options = PHFetchOptions()
            options.sortDescriptors = [ NSSortDescriptor(key: "creationDate", ascending: true) ]
            options.predicate = NSPredicate(format: "mediaType = %d", PHAssetMediaType.video.rawValue)
            options.includeHiddenAssets = true
            photos = PHAsset.fetchAssets(with: options)
            print(photos)
        }
        
    }
    func getImageinimageview() {
        if btncount == 0 {
            self.imgarry.removeAll()
            self.aseetarry.removeAll()
            if photos.count != 0 {
                for i in 0...photos.count - 1 {
                asset = photos!.object(at: i)
                    if asset.isHidden == true {
                        print(asset.localIdentifier)
                        let width: CGFloat = 500
                            let height: CGFloat = 800
                            let size = CGSize(width: 20, height: 20)
                        PHImageManager.default().requestImage(for: asset, targetSize: size, contentMode: PHImageContentMode.aspectFill, options: nil) { (image, userInfo) -> Void in
                            if(self.folderimgary[self.foldercount].count != 0){
                                for i in 0...self.folderimgary[self.foldercount].count - 1 {
                                    if(self.folderimgary[self.foldercount][i] == self.asset.localIdentifier){
                                        self.imgarry.append(image!)
                                        self.aseetarry.append(self.asset)
                                    }
                                }
                            }
                            }
                    }
                }
            }
        }else{
            self.videoarry.removeAll()
            self.aseetarry.removeAll()
            if photos.count != 0 {
                for i in 0...photos.count - 1{
                asset = photos!.object(at: i)
                    if asset.isHidden == true {
                        let width: CGFloat = 500
                            let height: CGFloat = 800
                            let size = CGSize(width:width, height:height)
                        PHImageManager.default().requestImage(for: asset, targetSize: size, contentMode: PHImageContentMode.aspectFill, options: nil) { (image, userInfo) -> Void in
                            if(self.foldervideoary[self.foldercount].count != 0){
                                for i in 0...self.foldervideoary[self.foldercount].count - 1 {
                                    if(self.foldervideoary[self.foldercount][i] == self.asset.localIdentifier){
                                        self.videoarry.append(image!)
                                        self.aseetarry.append(self.asset)
                                    }
                                }
                            }
                            }
                    }
                }
            }
        }
        self.collectionview.reloadData()
    }
    
    @IBAction func Addbtnclick(_ sender: Any) {
        if addcount == 0 {
            addview.isHidden = false
            addcount = 1
        }else{
            addview.isHidden = true
            addcount = 0
        }
    }
    @IBAction func Photosbtnclick(_ sender: Any) {
        let nxt = storyboard?.instantiateViewController(withIdentifier: "selectphotoVC") as! selectphotoVC
        navigationController?.pushViewController(nxt, animated: true)
        addview.isHidden = true
    }
    @IBAction func Videosbtnclick(_ sender: Any) {
        let nxt = storyboard?.instantiateViewController(withIdentifier: "SelectVideoVC") as! SelectVideoVC
        navigationController?.pushViewController(nxt, animated: true)
        addview.isHidden = true
    }
    @IBAction func Safephotosclick(_ sender: Any) {
        btncount = 0
        self.getAssetFromPhoto()
        self.getImageinimageview()
        self.photosfoworhide()
    }
    @IBAction func videosbtnclick(_ sender: Any) {
        btncount = 1
        self.getAssetFromPhoto()
        self.getImageinimageview()
        self.photosfoworhide()
    }
    
    @IBAction func Unhidebtnclick(_ sender: Any) {
        aset = aseetarry[hidecount]
        let width: CGFloat = 500
            let height: CGFloat = 800
            let size = CGSize(width:width, height:height)
        if btncount == 0 {
            PHPhotoLibrary.shared().performChanges({
                let request = PHAssetChangeRequest(for: self.aset)
                request.isHidden = !self.aset.isHidden
            }, completionHandler: { success, error in
                DispatchQueue.main.async {
                    if success {
                        print(self.folderimgary[self.foldercount].count)
                        for i in 0...self.folderimgary[self.foldercount].count - 1 {
                            print(i)
                            if(self.folderimgary[self.foldercount][i] == self.aset.localIdentifier){
                                print(i)
                                self.folderimgary[self.foldercount].remove(at: i)
                                break
                            }
                        }
                        let us = UserDefaults.standard
                        us.setValue(self.folderimgary, forKey: "folderimgary")
                        self.getAssetFromPhoto()
                        self.getImageinimageview()
                        self.photosfoworhide()
                    } else {
                        print("can't set hidden: \(String(describing: error))")
                    }
                }
            })
        }
        else{
            PHPhotoLibrary.shared().performChanges({
                let request = PHAssetChangeRequest(for: self.aset)
                request.isHidden = !self.aset.isHidden
            }, completionHandler: { success, error in
                DispatchQueue.main.async {
                    if success {
                        print(self.foldervideoary[self.foldercount].count)
                        for i in 0...self.foldervideoary[self.foldercount].count - 1 {
                            print(i)
                            if(self.foldervideoary[self.foldercount][i] == self.aset.localIdentifier){
                                print(i)
                                self.foldervideoary[self.foldercount].remove(at: i)
                                break
                            }
                        }
                        let us = UserDefaults.standard
                        us.setValue(self.foldervideoary, forKey: "foldervideoary")
                        self.getAssetFromPhoto()
                        self.getImageinimageview()
                        self.photosfoworhide()
                    } else {
                        print("can't set hidden: \(String(describing: error))")
                    }
                }
            })
        }
        Worningview.isHidden = true
        Blurview.isHidden = true
    }
    @IBAction func Deletbtnclick(_ sender: Any) {
        aset = aseetarry[hidecount]
        let completion = { (success: Bool, error: Error?) -> Void in
            if self.btncount == 0{
            DispatchQueue.main.async {
                if success {
                    print(self.folderimgary[self.foldercount].count)
                    for i in 0...self.folderimgary[self.foldercount].count - 1 {
                        print(i)
                        if(self.folderimgary[self.foldercount][i] == self.aset.localIdentifier){
                            print(i)
                            self.folderimgary[self.foldercount].remove(at: i)
                            break
                        }
                    }
                    let us = UserDefaults.standard
                    us.setValue(self.folderimgary, forKey: "folderimgary")
                    self.getAssetFromPhoto()
                    self.getImageinimageview()
                    self.photosfoworhide()
                } else {
                    print("can't set hidden: \(String(describing: error))")
                }
            }
            }else{
                DispatchQueue.main.async {
                    if success {
                        print(self.foldervideoary[self.foldercount].count)
                        for i in 0...self.foldervideoary[self.foldercount].count - 1 {
                            print(i)
                            if(self.foldervideoary[self.foldercount][i] == self.aset.localIdentifier){
                                print(i)
                                self.foldervideoary[self.foldercount].remove(at: i)
                                break
                            }
                        }
                        let us = UserDefaults.standard
                        us.setValue(self.foldervideoary, forKey: "foldervideoary")
                        self.getAssetFromPhoto()
                        self.getImageinimageview()
                        self.photosfoworhide()
                    } else {
                        print("can't set hidden: \(String(describing: error))")
                    }
                }
            }
        }
        if assetCollection != nil {
            // Remove asset from album
            PHPhotoLibrary.shared().performChanges({
                let request = PHAssetCollectionChangeRequest(for: self.assetCollection)!
                request.removeAssets([self.aset] as NSArray)
            }, completionHandler: completion)
        } else {
            // Delete asset from library
            PHPhotoLibrary.shared().performChanges({
                PHAssetChangeRequest.deleteAssets([self.aset] as NSArray)
            }, completionHandler: completion)
        }
        self.getAssetFromPhoto()
        self.getImageinimageview()
        self.photosfoworhide()
        Worningview.isHidden = true
        Blurview.isHidden = true
    }
    
    @IBAction func Backbtnclick(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(btncount == 0){
            return imgarry.count
        }else{
            return videoarry.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoscell", for: indexPath) as! photoscell
        cell.photoimg.layer.cornerRadius = 5
        if btncount == 0 {
            cell.photoimg.image = imgarry[indexPath.row]
        }else{
            cell.photoimg.image = videoarry[indexPath.row]
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        hidecount = indexPath.row
        Worningview.isHidden = false
        Blurview.isHidden = false
    }
}
