//
//  WeatherCollectionView.swift
//  weatherAppBang
//
//  Created by 방민지 on 11/7/23.
//

import UIKit
import Then
import SnapKit

class WeatherCollectionView: UIViewController, WeatherCollectionViewCellDelegate {
    
    let weatherCell = WeatherCollectionViewCell()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = .black
        setLayout()
        setupSearchController()
        setCollectionViewConfig()
        setCollectionViewLayout()
    }
    
    func didTapButton(in cell: WeatherCollectionViewCell) {
           // 버튼이 터치되었을 때의 처리 로직 구현
           let secondViewController = DetailMainView()
           navigationController?.pushViewController(secondViewController, animated: true)
       }
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.backgroundColor = .black
    }
    
    private func setLayout() {
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    // 서치 컨트롤러 추가
    func setupSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "도시 또는 공항 검색"
        searchController.hidesNavigationBarDuringPresentation = false
        self.navigationItem.searchController = searchController
        self.navigationItem.title = "날씨"
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    private func setCollectionViewConfig() {
        self.collectionView.register(WeatherCollectionViewCell.self,
                                     forCellWithReuseIdentifier: WeatherCollectionViewCell.identifier)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    private func setCollectionViewLayout() {
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.minimumLineSpacing = 16
        self.collectionView.setCollectionViewLayout(flowlayout, animated: false)
    }
}

extension WeatherCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 335, height: 117)
        }
}
extension WeatherCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherCollectionData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherCollectionViewCell.identifier, for: indexPath) as? WeatherCollectionViewCell else {return UICollectionViewCell()}
        item.delegate = self
        item.bindData(data: weatherCollectionData[indexPath.row])
        return item
    }
}
