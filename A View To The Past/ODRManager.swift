//
//  ODRManager.swift
//  A Look To The Past
//
//  Created by James O'Rourke on 05/01/2020.
//  Copyright © 2020 AppCoda. All rights reserved.
//

import Foundation

class ODRManager {

  static let shared = ODRManager()
  var currentRequest: NSBundleResourceRequest?

func requestSceneWith(tag: String,
                onSuccess: @escaping () -> Void,
                onFailure: @escaping (NSError) -> Void) {
    
  currentRequest = NSBundleResourceRequest(tags: [tag])
    print("in ODRManager with tag \(tag)")

  guard let request = currentRequest else { return }
    request.endAccessingResources()

    request.loadingPriority =
  NSBundleResourceRequestLoadingPriorityUrgent

  request.beginAccessingResources { (error: Error?) in
        

    if let error = error {
        print("\(request)")
        print("hello james error")
      onFailure(error as NSError)
      return
    }

    onSuccess()
  }
}


}

