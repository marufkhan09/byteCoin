//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC/"
    let apiKey = "8BC75C92-970E-43B5-9D33-316813632FEE"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    var currencyExchangeDelegate :  CurrencyExchangeDelegate?
    
    func getCoinPrice(for currency: String){
       let urlString = "\(baseURL)\(currency)?apikey=\(apiKey)"
        performRequest(with: urlString)
    }
    func performRequest(with urlString: String){
        //1. create a url
        if let url = URL(string: urlString){
            //2.create a urlsession
            let session = URLSession(configuration: .default)
            //3. give session a task
            
            let task = session.dataTask(with: url) { data, response, error in
                if(error != nil){
                    currencyExchangeDelegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if  let exchangeRate = parseJson(exRateData: safeData) {
                     
                        currencyExchangeDelegate?.didUpdateExchangeRate(_exRate: exchangeRate)
                    }
                }
                
            }
            task.resume()
            
        }
        
    }
    
    func  parseJson (exRateData: Data)-> ExChangeRateModel?{
        let decoder = JSONDecoder()
        
        do {
            let decodedData =  try  decoder.decode(CurrentExchangeRateModel.self, from: exRateData)
            let rate = decodedData.rate!
            let rateData = ExChangeRateModel(rate: rate)
            return rateData
        } catch {
            currencyExchangeDelegate?.didFailWithError(error: error)
            return nil
        }
    }

    
}
