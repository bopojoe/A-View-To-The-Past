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
class ARViewController: UIViewController,  QLPreviewControllerDelegate, QLPreviewControllerDataSource {
    
    var ARview = "";

    
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
          let url = Bundle.main.url(forResource: ARview, withExtension: "reality")!
            return url as QLPreviewItem
    }
    
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
            return 1
    }
    
    func viewAr(){
            let previewController = QLPreviewController()
            previewController.dataSource = self
            previewController.delegate = self
            self.present(previewController, animated: true)
                
                                   
    }
}
