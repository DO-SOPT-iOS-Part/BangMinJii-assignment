//
//  DetailMakeCollectionViewCell.swift
//  weatherAppBang
//
//  Created by 방민지 on 11/9/23.
//

import UIKit

import UIKit
import SnapKit

class DetailMakeCollectionViewCell: UICollectionViewCell, UICollectionViewDelegate {
    
    static let identifier: String = "DetailMakeCollectionViewCell"
    
     let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
        private var stateLabel: UILabel = {
            let label = UILabel()
            label.text = "당신의 마음속은 늘 눈부십니다, 마음속엔 늘 아요가 있기때문."
            label.textColor = .white
            label.font = .sfPro(size: 18, weight: .regular)
            label.numberOfLines = 2
            label.translatesAutoresizingMaskIntoConstraints = false
            label.adjustsFontSizeToFitWidth = true
            return label
        }()
    
        private var line: UIView = {
            let line = UIView()
            line.alpha = 0.2
            line.backgroundColor = UIColor.white
            line.heightAnchor.constraint(equalToConstant: 1).isActive = true
            return line
        }()
    
        private var weatherbox: UIView = {
            let view = UIView()
            view.layer.backgroundColor = UIColor.clear.cgColor
            view.layer.cornerRadius = 15
            view.layer.borderWidth = 0.5
            view.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.25).cgColor
            return view
        }()
    
    private func setCollectionViewConfig() {
        self.collectionView.register(DetailCollectionViewCell.self, forCellWithReuseIdentifier: DetailCollectionViewCell.identifier)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setLayout()
        setCollectionViewConfig()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        self.addSubview(weatherbox)
        weatherbox.addSubViews(stateLabel, line, collectionView)
        collectionView.dataSource = self
        weatherbox.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.top.equalToSuperview().inset(30)
            $0.bottom.equalToSuperview().inset(20)
        }
        collectionView.snp.makeConstraints {
            $0.top.equalTo(line.snp.bottom).offset(10)
            $0.leading.trailing.bottom.equalTo(weatherbox).inset(10)
        }
        stateLabel.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview().inset(10)
            $0.height.greaterThanOrEqualTo(30)
        }
        
        line.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.top.equalTo(stateLabel.snp.bottom).offset(11)
            $0.height.equalTo(1)
        }
    }
}


extension DetailMakeCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 60, height: 122)
        }
}
extension DetailMakeCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return detailCollectionData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCollectionViewCell.identifier, for: indexPath) as? DetailCollectionViewCell else {return UICollectionViewCell()}
        item.bindData(data: detailCollectionData[indexPath.item])
        return item
    }
}


//    private var stateLabel: UILabel = {
//        let label = UILabel()
//        label.text = "08:00~09:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다."
//        label.widthAnchor.constraint(equalToConstant: 305).isActive = true
//        label.textColor = .white
//        label.font = .sfPro(size: 18, weight: .regular)
//        label.numberOfLines = 0
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.adjustsFontSizeToFitWidth = true
//        return label
//    }()


//    private var line: UIView = {
//        let line = UIView()
//        line.alpha = 0.2
//        line.backgroundColor = UIColor.white
//        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
//        return line
//    }()

//    private var weatherbox: UIStackView = {
//        let view = UIStackView()
//        view.axis = .vertical
//        view.layer.backgroundColor = UIColor.clear.cgColor
//        view.layer.cornerRadius = 15
//        view.layer.borderWidth = 0.5
//        view.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.25).cgColor
//        return view
//    }()
