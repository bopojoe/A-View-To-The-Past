//
//  NavBarExtension.swift
//  A View To The Past
//
//  Created by James O'Rourke on 01/02/2020.
//  Copyright © 2020 James O'Rourke. All rights reserved.
//


import UIKit

class NavBar: UIViewController{

    func setupNavBarItems(){
        leftButtonSetup()
        rightButtonsSetup()
        titleSetup()
          
      }
    
    private func leftButtonSetup(){
        let backImg = UIImage(systemName: "arrow.left")
        let backButton = UIBarButtonItem(image: backImg, style: .plain, target: self, action: #selector(backPressed))
        navigationItem.leftBarButtonItem = backButton
    }
    
    private func rightButtonsSetup(){
        let mapImg = UIImage(systemName: "map")
        let mapButton = UIBarButtonItem(image: mapImg, style: .plain, target: self, action: #selector(mapPressed))
        
        let settingImg = UIImage(systemName: "person")
        let settingButton = UIBarButtonItem(image: settingImg, style: .plain, target: self, action: #selector(settingsPressed))
        
        navigationItem.rightBarButtonItems = [settingButton, mapButton]
    }
    
    private func titleSetup(){
        navigationItem.title = "A View To The Past"
        let title = UITextView()
        title.text = "A View To The Past"
        title.textColor = UIColor.black
        title.backgroundColor = UIColor.white
        navigationItem.titleView = title
    }
      
      @objc func backPressed() {
          print("back pressed")
      }
      
      @objc func mapPressed() {
          print("map Pressed")
      }
    
      @objc func settingsPressed() {
            print("settings Pressed")
        }}
