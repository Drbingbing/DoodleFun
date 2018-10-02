//
//  ViewController.swift
//  DoodleFun
//
//  Created by Dr. BingBing on 2018/10/2.
//  Copyright © 2018 Dr. BingBing. All rights reserved.
//

import UIKit

class DoodleFunViewController: UIViewController {
    
    private var doodleImages = ["DoodleIcons-1", "DoodleIcons-2", "DoodleIcons-3", "DoodleIcons-4", "DoodleIcons-5", "DoodleIcons-6", "DoodleIcons-7", "DoodleIcons-8", "DoodleIcons-9", "DoodleIcons-10", "DoodleIcons-11", "DoodleIcons-12", "DoodleIcons-13", "DoodleIcons-14", "DoodleIcons-15", "DoodleIcons-16", "DoodleIcons-17", "DoodleIcons-18", "DoodleIcons-19", "DoodleIcons-20"]
    
    @IBOutlet var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // 顯示目前手機特徵集合
        print("\(traitCollection)")
    }


}


extension DoodleFunViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return doodleImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! DoodleFunCollectionViewCell
        
        cell.imageView.image = UIImage(named: doodleImages[indexPath.row])
        
        return cell
    }
}

extension DoodleFunViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // (計算總面積 / 所有圖片數量個數) - Safe Area
        let collectionViewSize = collectionView.frame.size
        let collectionViewArea = Double(collectionViewSize.width * collectionViewSize.height)
        
        let sideSize: Double = sqrt(collectionViewArea / (Double(doodleImages.count))) - 32.0
        
        return CGSize(width: sideSize, height: sideSize)
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView.reloadData()
    }
}
