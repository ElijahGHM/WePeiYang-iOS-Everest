//
//  ExamCardCollectionView.swift
//  WePeiYang
//
//  Created by Elijah on 8/19/19.
//  Copyright © 2019 twtstudio. All rights reserved.
//

import Foundation
import UIKit

class ExamCardCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var pageNum: Int = 0
    var curPage: Int = 1
    let cellW: CGFloat = 50

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: cellW, height: cellW)

        
        self.contentSize = CGSize(width: frame.width - 10, height: frame.height)
        self.backgroundColor = .white
        self.contentInset = UIEdgeInsetsMake(20, 20, 20, 20)
        self.layer.cornerRadius = 5
        self.collectionViewLayout = layout
        self.isPagingEnabled = false
        self.showsVerticalScrollIndicator = true
        self.showsHorizontalScrollIndicator = false
        self.bounces = true
        self.register(ExamCardCollectionViewCell.self, forCellWithReuseIdentifier: "quesCollection cell")
        self.delegate = self
        self.dataSource = self

        

    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 70
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let selectedBlue = UIColor(red: 228/255, green: 243/255, blue: 1, alpha: 1)
        let selectedRed = UIColor(red: 1, green: 228/255, blue: 243/255, alpha: 1)
        
        let cell = self.dequeueReusableCell(withReuseIdentifier: "quesCollection cell", for: indexPath) as! ExamCardCollectionViewCell
        cell.label.text = "\(indexPath.item + 1)"
        cell.layer.cornerRadius = cellW * 0.5
        cell.layer.borderColor = UIColor.newBlue.cgColor
        cell.label.textColor = .newBlue
        return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


