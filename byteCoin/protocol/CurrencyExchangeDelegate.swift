//
//  CurrentExchangeDelegate.swift
//  byteCoin
//
//  Created by Maruf Khan on 6/11/23.
//

import Foundation


protocol CurrencyExchangeDelegate {
    func didUpdateExchangeRate(_exRate: ExChangeRateModel)
    func didFailWithError(error: Error)
}
