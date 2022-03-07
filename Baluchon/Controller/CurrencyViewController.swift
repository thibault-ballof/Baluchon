//
//  ConvertViewController.swift
//  Baluchon
//
//  Created by Thibault Ballof on 29/11/2021.
//

import UIKit

class ConvertViewController: UIViewController {
    
    
    //MARK: - DARK MODE SETTING & UI
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        textField.layer.borderWidth = CGFloat(1.0)
        textField.layer.borderColor = UIColor.red.cgColor
        textField.layer.cornerRadius = 10.0
        
    }
    // MARK: - VARIABLE FOR UI
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    //MARK: - API CALL FOR USD TO EUR
    @IBAction func ButtonConvertUSDToEUR(_ sender: Any) {
        if let text = textField.text {
            CurrencyService.shared.getCurrency(from: "from=USD", to: "&to=EUR", amount: "&amount=" + text) { (success, data) in
                if success {
                    self.updateCurrencyView(from: data!)
                }
            }
        }
    }
    //MARK: - API CALL FOR EUR TO USD
    @IBAction func ButtonConvertEURToUSD(_ sender: Any) {
        if let text = textField.text {
            CurrencyService.shared.getCurrency(from: "from=EUR", to: "&to=USD", amount: "&amount=" + text) { (sucess, data) in
                if sucess {
                    self.updateCurrencyView(from: data!)
                }
            }
        }
    }
    //MARK: - UPDATE CURRENCY VIEW
    func updateCurrencyView(from data: CurrencyObject) {
        self.result.text = data.result
    }
}
