//
//  ExamDetailCollectionVIew.swift
//  WePeiYang
//
//  Created by Elijah on 7/8/19.
//  Copyright © 2019 twtstudio. All rights reserved.
//
//
import Foundation
import UIKit

class ExamDetailCollectionVIew: UICollectionView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = UICollectionViewCell()
         return cell
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
}
