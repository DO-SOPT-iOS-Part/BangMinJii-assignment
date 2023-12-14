//
//  DetailCollectionViewCell.swift
//  weatherAppBang
//
//  Created by 방민지 on 11/8/23.
//

import UIKit
import SnapKit
import Then

class DetailCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "DetailCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        self.addSubViews(time, state, temp)
        
        time.snp.makeConstraints {
            $0.top.equalTo(self.snp.top).offset(3)
            $0.centerX.equalToSuperview()
        }
        
        state.snp.makeConstraints {
            $0.top.equalTo(time.snp.bottom).offset(14)
            $0.centerX.equalToSuperview()
        }
        
        temp.snp.makeConstraints {
            $0.top.equalTo(state.snp.bottom).offset(14)
            $0.centerX.equalToSuperview()
        }
    }
    
    private var time = UILabel().then {
        $0.font = .sfPro(size: 17, weight: .medium)
        $0.textColor = .white
    }
    
    private var state = UIImageView().then {
        $0.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
    }
    
    private var temp = UILabel().then {
        $0.font = .sfPro(size: 22, weight: .medium)
        $0.textColor = .white
    }

    func bindData(data: DetailCollectionData) {
        self.time.text = data.time
        self.state.image = UIImage(named: data.state)
        self.temp.text = data.temp
    }
}
