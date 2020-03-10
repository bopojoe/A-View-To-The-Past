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
class DetailViewController: UIViewController {

    var locationName = ""
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController  = segue.destination as! ARViewController
        viewController.ARview = self.locationName
    }
    
    @IBAction func arButton(_ sender: Any) {
        performSegue(withIdentifier: "toARView", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("in location: ", locationName)
    }
}
