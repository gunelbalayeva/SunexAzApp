//
//  HomePageViewController.swift
//  SunexAzApp
//
//  Created by User on 13.04.25.
//

import UIKit

enum FirstItem{
    case first(GroupFirstCollectionViewCell.Item)
}
enum SecondItem{
    case second(SecondCollectionViewCell.Item)
}
class HomePageViewController: UIViewController {
    
    let networkService = NetworkService()
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var idSerialLabel: UILabel!
    @IBOutlet weak var idNumberLabel: UILabel!
    @IBOutlet weak var CurrentMonthExpenses: UILabel!
    @IBOutlet weak var CurrentMonthExpensesView: UIProgressView!
    @IBOutlet weak var MonthlLlimit: UILabel!
    @IBOutlet weak var collectionviewfirst: UICollectionView!
    @IBOutlet weak var collectionviewSecond: UICollectionView!
    
    var token: String?
    
    var firstCollectionList:[FirstItem] = [
        .first(.init(image: "Vector (Stroke)", title: "Xaricdəki ünvanlarım")),
        .first(.init(image: "Bike R", title: "Kuryer xidməti")),
        .first(.init(image: "File R", title: "Bəyənnamələrim")),
        .first(.init(image: "Calculator R", title: "Kalkluyator")),
        .first(.init(image: "Tarifs", title: "Tariflər")),
        .first(.init(image: "Vector (Stroke) 1", title: "Tənzimləmələr"))
    ]
    var secondCollectionList:[SecondItem] = [
        .second(.init(image: "image1")),
        .second(.init(image: "image2")),
        .second(.init(image: "image3"))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionviewfirst.dataSource = self
        collectionviewfirst.delegate = self
        collectionviewSecond.dataSource = self
        collectionviewSecond.delegate = self
        
        //register
        collectionviewfirst.register(GroupFirstCollectionViewCell.nib, forCellWithReuseIdentifier: GroupFirstCollectionViewCell.identifier)
        collectionviewfirst.showsVerticalScrollIndicator = false
        collectionviewSecond.showsVerticalScrollIndicator = false
        collectionviewfirst.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        if let layout = collectionviewfirst.collectionViewLayout as? UICollectionViewFlowLayout {
            let width = (collectionviewfirst.frame.width / 2) - 10
            layout.itemSize = CGSize(width: width, height: 32)
            layout.minimumLineSpacing = 8
            layout.minimumInteritemSpacing = 10
        }
        if let layout = collectionviewSecond.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.itemSize = CGSize(width: collectionviewSecond.frame.width / 3, height: 140)
            layout.minimumLineSpacing = 0
            layout.minimumInteritemSpacing = 0
        }
        if let token = token {
            fetchDashboardData(token: token)
        } else {
            print("Token mövcud deyil.")
        }
    }
    
    func fetchDashboardData(token: String) {
        networkService.getDashboard(token: token) { result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.userName.text = "\(response.user.Name) \(response.user.Surname)"
                    self.idSerialLabel.text = "ID:\(response.user.CustomerNumber) -VIP"
                    self.CurrentMonthExpenses.text = "$\(response.currentlyTotalAmountInMonth)"
                    let progress = response.currentlyTotalAmountInMonth / response.user.BalanceUSD
                    self.CurrentMonthExpensesView.progress = Float(progress)
                    self.MonthlLlimit.text = "$\(response.user.BalanceUSD)"
                    
                }
            case .failure(let error):
                print("Failed to fetch dashboard data: \(error.localizedDescription)")
            }
        }
    }
    
}

extension HomePageViewController:UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionviewfirst {
            return firstCollectionList.count
        } else {
            return secondCollectionList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionviewfirst {
            guard let cell = collectionviewfirst.dequeueReusableCell(withReuseIdentifier: GroupFirstCollectionViewCell.identifier, for: indexPath) as? GroupFirstCollectionViewCell else {
                return UICollectionViewCell()
            }
            let item = firstCollectionList[indexPath.row]
            switch item {
            case .first(let model):
                cell.configure(with: model)
            }
            return cell
        } else {
            guard let cell = collectionviewSecond.dequeueReusableCell(withReuseIdentifier: SecondCollectionViewCell.identifier, for: indexPath) as? SecondCollectionViewCell else {
                return UICollectionViewCell()
            }
            let item = secondCollectionList[indexPath.row]
            switch item {
            case .second(let model):
                cell.configure(with: model)
            }
            return cell
        }
    }
}
