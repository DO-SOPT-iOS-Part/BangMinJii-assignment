//
//  DayWeatherCollectionViewCell.swift
//  weatherAppBang
//
//  Created by 방민지 on 11/9/23.
//


import UIKit
import SnapKit
import Then

class DayWeatherCollectionViewCell: UICollectionViewCell {

    static let identifier: String = "DayWeatherCollectionViewCell"
    
    private var itemRow: Int?
    override init(frame: CGRect) {
            super.init(frame: frame)
            self.setLayout()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
        private func setLayout() {
            self.addSubViews(day, image, lowTemp, tempBar, highTemp)
        }

    private var day = UILabel().then {
        $0.font = .sfPro(size: 22, weight: .medium)
        $0.textColor = .white
    }
    
    private var image = UIImageView().then {
        $0.frame = CGRect(x: 0, y: 0, width: 28, height: 26)
    }
    
    private var percentage = UILabel().then {
        $0.font = .sfPro(size: 15, weight: .regular)
        $0.textColor = UIColor(red: 0.506, green: 0.812, blue: 0.98, alpha: 1)
    }
    
    private var lowTemp = UILabel().then {
        $0.font = .sfPro(size: 22, weight: .medium)
        $0.textColor = .white
        $0.alpha = 0.3
    }
    
    private var tempBar = UIImageView().then {
        $0.frame =  CGRect(x: 0, y: 0, width: 108, height: 12)
    }
    
    private var highTemp = UILabel().then {
        $0.font = .sfPro(size: 22, weight: .medium)
        $0.textColor = .white
    }
    
    func bindData(data: DayWeatherCollectionData) {
        self.day.text = data.day
        self.image.image = UIImage(named: data.image)
        self.percentage.text = data.percentage
        self.tempBar.image = UIImage(named: data.tempBar)
        self.highTemp.text = data.highTemp
        self.lowTemp.text = data.lowTemp
        
        if percentage.text != nil {
                // percentage가 nil이 아 아닐 때
           self.addSubview(percentage)
            day.snp.makeConstraints {
                $0.top.equalTo(self.snp.top).offset(16)
                $0.leading.equalTo(self.snp.leading).offset(14)
            }
            
            image.snp.makeConstraints {
                $0.top.equalTo(self.snp.top).offset(7)
                $0.leading.equalTo(self.snp.leading).offset(77)
            }
            
            percentage.snp.makeConstraints {
                $0.top.equalTo(image.snp.bottom).offset(0.85)
                $0.leading.equalTo(self.snp.leading).offset(84)
            }
            
            lowTemp.snp.makeConstraints {
                $0.top.equalTo(self.snp.top).offset(14)
                $0.leading.equalTo(self.snp.leading).offset(130)
            }
            
            tempBar.snp.makeConstraints {
                $0.top.equalTo(self.snp.top).offset(22)
                $0.leading.equalTo(self.snp.leading).offset(169)
            }
            
            highTemp.snp.makeConstraints {
                $0.top.equalTo(self.snp.top).offset(14)
                $0.leading.equalTo(self.snp.leading).offset(282)
            }
            } else { //percentage가 nil 일때
                day.snp.makeConstraints {
                    $0.top.equalTo(self.snp.top).offset(16)
                    $0.leading.equalTo(self.snp.leading).offset(14)
                }
                
                image.snp.makeConstraints {
                    $0.top.equalTo(self.snp.top).offset(14)
                    $0.leading.equalTo(self.snp.leading).offset(87)
                }
                
                lowTemp.snp.makeConstraints {
                    $0.top.equalTo(self.snp.top).offset(14)
                    $0.leading.equalTo(self.snp.leading).offset(130)
                }
                
                tempBar.snp.makeConstraints {
                    $0.top.equalTo(self.snp.top).offset(22)
                    $0.leading.equalTo(self.snp.leading).offset(169)
                }
                
                highTemp.snp.makeConstraints {
                    $0.top.equalTo(self.snp.top).offset(14)
                    $0.leading.equalTo(self.snp.leading).offset(282)
                }
            }
        }
}
