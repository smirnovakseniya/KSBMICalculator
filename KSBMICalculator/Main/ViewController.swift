//
//  ViewController.swift
//  KSBMICalculator
//
//  Created by Kseniya Smirnova on 13.11.22.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    func showUserInfo(userData: UserData)
}

class ViewController: UIViewController {
    var presenter: MainPresenterProtocol?
    
    @IBOutlet weak var genderSegmentControl: UISegmentedControl!
    @IBOutlet weak var agePicker: UIPickerView!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var calculateButton: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    
        setupUI()
        presenter?.viewDidloaded()
        calculateButton.backgroundColor = (weightTextField.text != "" && heightTextField.text != "") ? UIColor(named: "MainColor") : .gray
    }
}

extension ViewController {
    func setupUI() {
        genderSegmentControl.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
        agePicker.setValue(UIColor.white, forKeyPath: "textColor")
        calculateButton.backgroundColor = .gray
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapView)))
    }
}

extension ViewController {
    
    @IBAction func tapCalculateButton(_ sender: Any) {
        if weightTextField.text != "", heightTextField.text != "" {
            let newUserData = UserData(gender: genderSegmentControl.selectedSegmentIndex == 0 ? .male : .female,
                                       age: agePicker.selectedRow(inComponent: 0) + 18,
                                       weight: Int(weightTextField.text ?? "0") ?? 0,
                                       height: Int(heightTextField.text ?? "0") ?? 0)
            presenter?.didTapedCalculateButton(userData: newUserData)
        }
    }
    
    @objc func tapView() {
        view.endEditing(true)
    }
}

extension ViewController: MainViewProtocol {
    func showUserInfo(userData: UserData) {
        genderSegmentControl.selectedSegmentIndex = (userData.gender == .male) ? 0 : 1
        agePicker.selectRow(userData.age - 18, inComponent: 0, animated: true)
        weightTextField.text = userData.weight.description
        heightTextField.text = userData.height.description
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var picker: Int = 0
        picker = presenter?.createArrayPickerView().count ?? 0
        return picker
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var picker: String? = nil
        picker = presenter?.createArrayPickerView()[row].description
        return picker
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        switch textField {
        case weightTextField:
            weightTextField.text = ""
        case heightTextField:
            heightTextField.text = ""
        default:
            break
        }
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        calculateButton.backgroundColor = (weightTextField.text != "" && heightTextField.text != "") ? UIColor(named: "MainColor") : .gray
        return true
    }
}

