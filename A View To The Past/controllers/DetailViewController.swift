//
//  DetailViewController.swift
//  A View To The Past
//
//  Created by James O'Rourke on 02/03/2020.
//  Copyright © 2020 James O'Rourke. All rights reserved.
//



import UIKit
import Foundation
import QuickLook
import SpriteKit
import FirebaseStorage

class DetailViewController: UIViewController,  QLPreviewControllerDelegate, QLPreviewControllerDataSource {
    
    var ARview = "";
    let storage = Storage.storage()
    var modelView : URL?
    
    var locationName = ""
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController  = segue.destination as! ARViewController
        viewController.ARview = self.locationName
    }
    
    @IBAction func arButton(_ sender: Any) {
        //performSegue(withIdentifier: "toARView", sender: self)
        let fileManager = FileManager.default
        let documentDir = try! fileManager.url(for: .documentDirectory, in:.userDomainMask, appropriateFor: nil, create: true)
        let localFile = documentDir.appendingPathComponent("\(locationName).reality")
        
        let fileExists = FileManager().fileExists(atPath: localFile.path)
        
        if(fileExists){
            print("local file")
            self.modelView = localFile
            self.viewAr()
        }else{
            let ARReftwo = storage.reference(withPath:"models/\(locationName).reality")
            ARReftwo.write(toFile: localFile ) { (url, error) in
                print("hello")
                if let error = error { print("Got an error fetching data:\(error.localizedDescription)")
                    return
                }
                if let url = url {
                    print("File was downloaded to \(url.absoluteString)")
                    self.modelView = url
                    self.viewAr()
                }
                
            }
            
        }
        
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        return modelView! as QLPreviewItem
        
    }
    
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }
    
    func viewAr(){
        let previewController = QLPreviewController()
        previewController.dataSource = self
        previewController.delegate = self
        self.present(previewController, animated: true)
        print("finished")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("in location: ", locationName)
    }
    
    
    
    
    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //        print("in Arview with: ", ARview)
    
    
    
    
    
    
}
