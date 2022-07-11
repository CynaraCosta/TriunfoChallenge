//
//  ViewController.swift
//  TriunfoChallenge
//
//  Created by Cynara Costa on 04/07/22.
//

import UIKit

class FeaturedViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var nowPlayingCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popularCollectionView.dataSource = self
        popularCollectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "popularCell", for: indexPath) as? popularCollectionViewCell
        
        cell?.titleLabel.text = "Título do filme"
        cell?.image.image = UIImage()
        cell?.image.backgroundColor = .red
        
        return cell ?? UICollectionViewCell() // se cell n existir, retorna uicollectionviewcell
    }


}

