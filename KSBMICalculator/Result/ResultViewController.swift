//
//  ResultViewController.swift
//  KSBMICalculator
//
//  Created by Kseniya Smirnova on 14.11.22.
//

import UIKit
import RealmSwift

protocol ResultViewProtocol: AnyObject {
    func showResult(newUserData: UserData, BMI: Double, idealWeight: String)
}

class ResultViewController: UIViewController {
    var presenter: ResultPresenterProtocol?
    
    @IBOutlet weak var widthLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    @IBOutlet weak var BMILabel: UILabel!
    
    @IBOutlet weak var idealWidthLabel: UILabel!
    
    @IBOutlet weak var BMITableView: UITableView!
    @IBOutlet weak var historyCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BMITableView.register(UINib(nibName: "BMITableViewCell", bundle: nil), forCellReuseIdentifier: BMITableViewCell.reuseIdentifier)
        historyCollectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CollectionViewCell.reuseIdentifier)
        
        presenter?.setBMIResult()
        presenter?.addHistory()
    }
}

extension ResultViewController: ResultViewProtocol {
    func showResult(newUserData: UserData, BMI: Double, idealWeight: String) {
        widthLabel.text = newUserData.weight.description + " kg"
        heightLabel.text = newUserData.height.description + " cm"
        ageLabel.text = newUserData.age.description + " y"
        genderLabel.text = newUserData.gender.rawValue
        BMILabel.text = BMI.description
        idealWidthLabel.text = idealWeight
    }
}

extension ResultViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.tableViewCellCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BMITableViewCell.reuseIdentifier, for: indexPath) as? BMITableViewCell else { return BMITableViewCell() }
        cell.setCells((presenter?.tableViewCellData(row: indexPath.row))!)
        cell.selectedBMICell(data: (presenter?.tableViewCellData(row: indexPath.row))!,
                             BMI: (presenter?.calculateBMI())!, index: indexPath.row)
        return cell
    }
}

extension ResultViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.collectionViewCellCount() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier, for: indexPath) as? CollectionViewCell else { return CollectionViewCell() }
        
        cell.setCell((presenter?.collectionViewCellData(row: indexPath.row))!)
        return cell
    }
}
