
import UIKit
import Foundation
import QuickLook
 
class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, QLPreviewControllerDelegate, QLPreviewControllerDataSource {
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
            return 1
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
      let url = Bundle.main.url(forResource: self.models[self.thumbnailIndex], withExtension: "reality")!
        return url as QLPreviewItem
}
    
   
    
    
    //    var isComplete: Bool = false
//    var first:Bool = true
    
    @IBOutlet var collectionView: UICollectionView!
    let models = ["donut","cup"]
    
    var thumbnails = [UIImage]()
    var thumbnailIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBarItems()
        
        for model in models {
            if let thumbnail = UIImage(named: "\(model).jpg") {
                thumbnails.append(thumbnail)
                print("here \(model)")
             
               
            }
        }
//        print("here!!!!!")
//        if (first || isComplete){
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.reloadData()
//        }
    }
    
    
 
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LibraryCell", for: indexPath) as? LibraryCollectionViewCell
        
        if let cell = cell {
            cell.modelThumbnail.image = thumbnails[indexPath.item]
            let title = models[indexPath.item]
            cell.modelTitle.text = title.capitalized
        }
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    thumbnailIndex = indexPath.item
//        first = false
//      ODRManager.shared.requestSceneWith(tag: "\(self.models[self.thumbnailIndex])", onSuccess: {
//                                            print("success")
//                                               self.isComplete = true
//
//                                       },
//                                         // 3
//                                         onFailure: { (error) in
//                                             print("\n\n\n\n\n\n\n\n\nin here too onFailure")
//
//                                           let controller = UIAlertController(
//                                             title: "Error",
//                                             message: "There was a problem.",
//                                             preferredStyle: .alert)
//
//                                           controller.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
//                                           guard let rootViewController = self.view?.window?.rootViewController else { return }
//
//                                           rootViewController.present(controller, animated: true)
//                     })
//                 DispatchQueue.main.asyncAfter(deadline: .now() + 22.0) { // Change `2.0` to the desired number of seconds.
//                    if self.isComplete {
//                        print("in here and isComplete is \(self.isComplete)")
              let previewController = QLPreviewController()
              previewController.dataSource = self
              previewController.delegate = self
              self.present(previewController, animated: true)
//          }else{
//             print("downloading")
//          }
//}
       
}

}

