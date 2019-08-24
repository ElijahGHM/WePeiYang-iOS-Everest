//
//  ExamCardCollectionViewCell.swift
//  WePeiYang
//
//  Created by Elijah on 8/19/19.
//  Copyright © 2019 twtstudio. All rights reserved.
//

import Foundation

class ExamCardCollectionViewCell: UICollectionViewCell {
    let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.borderWidth = 1
        self.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.width.equalTo(25)
            make.height.equalTo(12)
            make.center.equalTo(self)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
