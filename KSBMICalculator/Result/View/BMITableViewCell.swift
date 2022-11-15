//
//  BMITableViewCell.swift
//  KSBMICalculator
//
//  Created by Kseniya Smirnova on 14.11.22.
//

import UIKit

class BMITableViewCell: UITableViewCell {
    
    static let reuseIdentifier: String = "BMITableViewCell"
    
    struct ResultCell {
        let row: Int
        let color: String
        var name: String
        let result: String
    }
    
    @IBOutlet weak var circleImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setCells(_ data: ResultCell) {
        circleImageView.tintColor = UIColor(named: data.color)
        nameLabel.text = data.name
        resultLabel.text = data.result
    }
    
    func selectedBMICell(data: ResultCell, BMI: Double, index: Int) {
        if colorBMI(BMI: BMI) == index {
            circleImageView.image = UIImage(systemName: "circle.fill")
            nameLabel.textColor = UIColor(named: data.color)
            resultLabel.textColor = UIColor(named: data.color)
        } else {
            circleImageView.image = UIImage(systemName: "circle")
            nameLabel.textColor = .white
            resultLabel.textColor = .white
        }
    }
    
   private func colorBMI(BMI: Double) -> Int {
        switch BMI {
        case ..<16.0:
            return 0
        case 16.0...16.9:
            return 1
        case 16.9...18.4:
            return 2
        case 18.4...24.9:
            return 3
        case 24.9...29.9:
            return 4
        case 29.9...34.9:
            return 5
        case 34.9...39.9:
            return 6
        default:
            return 7
        }
    }
}
