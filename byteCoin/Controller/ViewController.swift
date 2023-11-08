//
//  ViewController.swift
//  byteCoin
//
//  Created by Maruf Khan on 22/10/23.
//

import UIKit
import Toast

class ViewController: UIViewController {
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var coinView: UIView!
    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    var coinManager = CoinManager()
    override func viewDidLoad() {
        coinView.roundCorners(radius: 35)
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        coinManager.currencyExchangeDelegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}
//MARK: - pickerview data source
extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        (coinManager.currencyArray.count)
    }
    
    
    
}

extension ViewController : UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        coinManager.currencyArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(coinManager.currencyArray[row])
        self.currencyLabel.text = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: coinManager.currencyArray[row])
    }
}

extension ViewController :CurrencyExchangeDelegate {
    func didUpdateExchangeRate(_exRate: ExChangeRateModel) {
        DispatchQueue.main.async {
            print(_exRate.rate.round(to: 5))
            self.bitcoinLabel.text = "\(_exRate.rate.round(to: 2))"
        }
        
    }
    
    func didFailWithError(error: Error) {
        self.view.makeToast(error.localizedDescription)
    }
    
    
}



