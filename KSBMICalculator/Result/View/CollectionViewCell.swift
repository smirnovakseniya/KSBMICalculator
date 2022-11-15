//
//  CollectionViewCell.swift
//  KSBMICalculator
//
//  Created by Kseniya Smirnova on 15.11.22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier: String = "BMICollectionViewCell"
    
    struct ResultCell {
        let date: Date
        let gender: Gender
        let age: Int
        let weight: Int
        let height: Int
        let BMI: Double
    }
    
    @IBOutlet weak var dateLable: UILabel!
    @IBOutlet weak var genderLable: UILabel!
    @IBOutlet weak var ageLable: UILabel!
    @IBOutlet weak var weightLable: UILabel!
    @IBOutlet weak var heightLable: UILabel!
    @IBOutlet weak var BMILable: UILabel!
    
    @IBOutlet weak var bgView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.layer.cornerRadius = 10
    }
    
    func setCell(_ data: ResultCell) {
        dateLable.text = data.date.formatted(date: .numeric, time: .omitted)
        genderLable.text = data.gender.rawValue
        ageLable.text = data.age.description + " y"
        weightLable.text = data.weight.description + " kg"
        heightLable.text = data.height.description + " cm"
        BMILable.text = data.BMI.description  
    }
}
