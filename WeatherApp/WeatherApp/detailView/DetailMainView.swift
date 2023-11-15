//
//  DetailMainView.swift
//  weatherAppBang
//
//  Created by 방민지 on 11/9/23.
//

import UIKit
import Then
import SnapKit

class DetailMainView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setCollectionViewConfig()
        setCollectionViewLayout()
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
        list.addTarget(self, action: #selector(handleListTap), for: .touchUpInside)
        setLayout()
    }
    
    @objc func handleListTap() {
        navigationController?.popViewController(animated: true)
    }
    
    
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let backgroundImage = UIImage(named: "background")
        $0.backgroundColor = .clear
        $0.backgroundView = UIImageView(image: backgroundImage)
    }
    
    private var bottomBar: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.layer.backgroundColor = UIColor.clear.cgColor
        view.layer.borderWidth = 0.5
        //view.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.25).cgColor
        view.layer.backgroundColor = UIColor(red: 0.165, green: 0.188, blue: 0.251, alpha: 1).cgColor
        return view
    }()
    
    private var map: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "map")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private var myLocation: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "myLocation")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private var dot: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "dot")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private  var list: UIButton = {
        let list = UIButton()
        list.setImage(UIImage(named: "list"), for: .normal)
        list.isUserInteractionEnabled = true
        return list
    }()

    private func setLayout() {
        self.view.addSubview(collectionView)
        self.view.addSubview(bottomBar)
        bottomBar.addArrangeSubViews(map, myLocation, dot, list)
        
        collectionView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        bottomBar.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(80)
            $0.bottom.equalToSuperview()
        }
        
        map.snp.makeConstraints { make in
            make.leading.equalTo(bottomBar).offset(10)
            make.trailing.equalTo(bottomBar).offset(-321)
            make.top.equalTo(bottomBar).offset(4)
        }

        myLocation.snp.makeConstraints { make in
            make.leading.equalTo(bottomBar).offset(161)
            make.trailing.equalTo(bottomBar).offset(-190)
            make.top.equalTo(bottomBar).offset(14)
        }

        dot.snp.makeConstraints { make in
            make.leading.equalTo(bottomBar).offset(189)
            make.trailing.equalTo(bottomBar).offset(-162)
            make.top.equalTo(bottomBar).offset(14)
        }

        list.snp.makeConstraints { make in
            make.leading.equalTo(bottomBar).offset(322)
            make.trailing.equalTo(bottomBar).offset(-9)
            make.top.equalTo(bottomBar).offset(4)
        }
    }
    
    
    private func setCollectionViewConfig() {
        self.collectionView.register(DayWeatherCollectionViewCell.self,
                                     forCellWithReuseIdentifier: DayWeatherCollectionViewCell.identifier)
        
        self.collectionView.register(DetailMakeCollectionViewCell.self, forCellWithReuseIdentifier: DetailMakeCollectionViewCell.identifier)
        
        self.collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    private func setCollectionViewLayout() {
        let flowlayout = UICollectionViewFlowLayout()
        //flowlayout.minimumLineSpacing = 16
        self.collectionView.setCollectionViewLayout(flowlayout, animated: false)
    }
}

extension DetailMainView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            // 첫 번째 섹션
            return CGSize(width: 335, height: 212)
        } else if indexPath.section == 1 {
            return CGSize(width: collectionView.frame.size.width , height: 250)
        }
        else {
            // 세 번째 섹션
            return CGSize(width: 335, height: 55)
        }
    }
}


extension DetailMainView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // 섹션의 개수를 반환
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            // 첫 번째 섹션
            return 1
        } else if section == 1 {
            // 두 번째 섹션
            return 1
        } else {
            // 세 번째 섹션
            return dayWeatherCollectionData.count
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as? TitleCollectionViewCell else {return UICollectionViewCell()}
            return cell
            
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailMakeCollectionViewCell.identifier, for: indexPath) as? DetailMakeCollectionViewCell else {return UICollectionViewCell()}
            return cell
            
        case 2:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: DayWeatherCollectionViewCell.identifier, for: indexPath) as? DayWeatherCollectionViewCell else {return UICollectionViewCell()}
            item.bindData(data: dayWeatherCollectionData[indexPath.row])
            return item
            
            
        default:
            return UICollectionViewCell()
            
        }
    }
}
