//
//  HomeViewController.swift
//  BasicIOS-toturial-CollectionView
//
//  Created by Apple on 01/08/2021.
//

import UIKit

class HomeViewController: UIViewController {


    @IBOutlet weak var collectionView: UICollectionView!
    var users :[User] = User.getDummyDatas()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        
        //make header
        let headerNib = UINib(nibName: "HomeHeaderView", bundle: .main)
        collectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        // make layout
        let nib = UINib(nibName: "HomeCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        // set width for collection View
        let screenWidth = UIScreen.main.bounds.width - 10
        // make layout
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: screenWidth/3, height: (screenWidth/3)*5/4)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        // add to collection View
        
        collectionView!.collectionViewLayout = layout
        
        
    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCell
        
        let item = users[indexPath.row]
        cell.label.text = item.name
        cell.imageLabel.image = UIImage(named: item.avatar)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
         return CGSize(width: collectionView.frame.width, height: 50)
     }
     
     func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

         switch kind {
         case UICollectionView.elementKindSectionHeader:
                let reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header", for: indexPath) as! HomeHeaderView

                reusableview.frame = CGRect(x: 0 , y: 0, width: self.view.frame.width, height: 50)
                
                reusableview.titleLabel.text = "Users"
            reusableview.totalLabels.text = "\(users.count)"
                
                 return reusableview
         default:
             fatalError("Unexpected element kind")
         }
     }

}

