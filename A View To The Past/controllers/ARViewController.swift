//
//  ARViewController.swift
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
class ARViewController: UIViewController,  QLPreviewControllerDelegate, QLPreviewControllerDataSource {
    
    var ARview = "";
    let FBurl = "gs://iosappfyp.appspot.com/files"
    let storage = Storage.storage()
    var modelView : URL?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("in Arview with: ", ARview)
        let storageRef = storage.reference()
        let home_dir = NSHomeDirectory();
        
        let localURL = URL(string: "file:///private\(home_dir)/tmp/downloads/\(ARview).reality")
        print(localURL)
        ///var/mobile/Containers/Data/Application/79DD08FB-844B-4B73-9BB0-C29DA1ACBC15/Library/Caches/cup.reality
//        file:///private/var/containers/Bundle/Application/CB5B4D69-3788-49B0-9FD4-811DED031727/A%20View%20To%20The%20Past.app/cup.reality
        //file://private/var/mobile/Containers/Data/Application/32C3BB49-641F-4080-B5D8-9B3BE85A5B97/Library/Caches/cup.reality
        
        
        let ARRef = storage.reference(forURL: "https://firebasestorage.googleapis.com/v0/b/iosappfyp.appspot.com/o/models%2Fcup.reality?alt=media&token=4123fbad-b476-43dc-9c0f-76cd7fcfb57f")
//
      //  let modelsRef = storageRef.child("files/models")
      //  let storagePath = "\(FBurl)/models/\(ARview).reality?alt=media"
        // Create a reference to the file you want to download
      //  let ARRef = storageRef.child("\(modelsRef)/\(ARview).reality")
        
        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
//        ARRef.getData(maxSize: 20 * 1024 * 1024) { data, error in
//            if let error = error {
//                print("Uh-oh, an error occurred!", error)
//            } else {
//                // Data is returned
//                print( "done")
//                self.modelView = data
//                self.viewAr()
//
//            }
//        }
        
        let fileManager = FileManager.default
        let documentDir = try! fileManager.url(for: .documentDirectory, in:.userDomainMask, appropriateFor: nil, create: true)
        let localFile = documentDir.appendingPathComponent("\(ARview).reality")
        let ARReftwo = storage.reference(withPath:"models/\(ARview).reality")
        let monitor = ARReftwo.write(toFile: localFile ) { (url, error) in
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
        
        monitor.observe(.success) { snapshot in
            print("download complete!!!")
            
        }

//        let downloadTask = ARRef.write(toFile: localURL!) { url, error in
//            if let error = error {
//                print("problem",error)
//                // Uh-oh, an error occurred!
//            } else {
//                print(url)
//                self.modelView = url
//            }
//        }
//        viewAr()
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
}
