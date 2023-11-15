//
//  WeatherCollectionViewCell.swift
//  weatherAppBang
//
//  Created by 방민지 on 11/7/23.
//

import UIKit
import SnapKit
import Then

protocol WeatherCollectionViewCellDelegate: AnyObject {
    func didTapButton(in cell: WeatherCollectionViewCell)
}

class WeatherCollectionViewCell: UICollectionViewCell {

    static let identifier: String = "WeatherCollectionViewCell"
    weak var delegate: WeatherCollectionViewCellDelegate?
    
    private var itemRow: Int?
    override init(frame: CGRect) {
            super.init(frame: frame)
            self.setLayout()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setLayout() {
            self.contentView.addSubview(backgroundSmall)
            [location, time, state, temp, highTemp, lowTemp].forEach {
                backgroundSmall.addSubview($0)
            }
            
            backgroundSmall.snp.makeConstraints {
                $0.edges.equalToSuperview()
            }
            
            location.snp.makeConstraints {
                $0.left.equalTo(backgroundSmall.snp.left).offset(16)
                $0.top.equalTo(backgroundSmall.snp.top).offset(10)
            }
            
            time.snp.makeConstraints {
                $0.left.equalTo(backgroundSmall.snp.left).offset(16)
                $0.top.equalTo(backgroundSmall.snp.top).offset(44)
            }
            
            state.snp.makeConstraints {
                $0.left.equalTo(backgroundSmall.snp.left).offset(16)
                $0.top.equalTo(backgroundSmall.snp.top).offset(87)
            }
            
            temp.snp.makeConstraints {
                $0.left.equalTo(backgroundSmall.snp.left).offset(249)
                $0.top.equalTo(backgroundSmall.snp.top).offset(4)
            }
            
            highTemp.snp.makeConstraints {
                $0.left.equalTo(backgroundSmall.snp.left).offset(196)
                $0.top.equalTo(backgroundSmall.snp.top).offset(87)
            }
            
            lowTemp.snp.makeConstraints {
                $0.left.equalTo(backgroundSmall.snp.left).offset(262)
                $0.top.equalTo(backgroundSmall.snp.top).offset(87)
            }
        }
        
    private var backgroundSmall = UIButton().then {
        $0.setImage(UIImage(named: "backgroundSmall"), for: .normal)
        $0.isUserInteractionEnabled = true
        $0.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    @objc func buttonTapped() {
           delegate?.didTapButton(in: self)
       }
    private var location = UILabel().then {
        $0.font = .sfPro(size: 24, weight: .bold)
        $0.textColor = .white
    }
    
    private var time = UILabel().then {
        $0.font = .sfPro(size: 17, weight: .medium)
        $0.textColor = .white
    }
    
    private var state = UILabel().then {
        $0.font = .sfPro(size: 16, weight: .medium)
        $0.textColor = .white
    }
    
    private var temp = UILabel().then {
        $0.font = .sfPro(size: 52, weight: .light)
        $0.textColor = .white
    }
    
    private var highTemp = UILabel().then {
        $0.font = .sfPro(size: 15, weight: .medium)
        $0.textColor = .white
    }
    
    private var lowTemp = UILabel().then {
        $0.font = .sfPro(size: 15, weight: .medium)
        $0.textColor = .white
    }
    
    func bindData(data: WeatherCollectionData) {
        self.location.text = data.location
        self.time.text = data.time
        self.state.text = data.state
        self.temp.text = data.temp
        self.highTemp.text = data.highTemp
        self.lowTemp.text = data.lowTemp
        }
}

