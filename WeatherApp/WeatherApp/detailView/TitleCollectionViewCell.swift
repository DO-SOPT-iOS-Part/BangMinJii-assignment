//
//  TitleCollectionViewCell.swift
//  weatherAppBang
//
//  Created by 방민지 on 11/9/23.
//

import UIKit
import Then

class TitleCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "TitleCollectionViewCell"
    
    private var itemRow: Int?
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupSubviews()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    
    private var location = UILabel().then {
        $0.font = .sfPro(size: 36, weight: .regular)
        $0.text = "니마음속"
        $0.textColor = .white
    }
    
    private var temp = UILabel().then {
        $0.font = .sfPro(size: 102, weight: .thin)
        $0.text = "21°"
        $0.textColor = .white
    }
    
    private var state = UILabel().then {
        $0.font = .sfPro(size: 24, weight: .regular)
        $0.text = "눈부심"
        $0.textColor = .white
    }
    
    private var highLowTemp = UILabel().then {
        $0.font = .sfPro(size: 20, weight: .medium)
        $0.text = "최고:29° 최저:15°"
        $0.textColor = .white
    }

    private func setupSubviews() {
        self.addSubViews(location, temp, state, highLowTemp)
        
        location.snp.makeConstraints {
            $0.top.equalTo(self.snp.top)
            $0.centerX.equalTo(self.snp.centerX)
        }
        
        temp.snp.makeConstraints {
            $0.top.equalTo(location.snp.bottom).offset(4)
            $0.centerX.equalTo(self.snp.centerX)
        }
        
        state.snp.makeConstraints {
            $0.top.equalTo(temp.snp.bottom).offset(4)
            $0.centerX.equalTo(self.snp.centerX)
        }
        
        highLowTemp.snp.makeConstraints {
            $0.top.equalTo(state.snp.bottom).offset(4)
            $0.centerX.equalTo(self.snp.centerX)
        }
    }

}
