//
//  roundDouble.swift
//  byteCoin
//
//  Created by Maruf Khan on 8/11/23.
//

import Foundation

extension Double {
        func round(to places: Int)-> Double{
        let precisionNum = pow(10, Double(places))
      var  n = self
        n = n * precisionNum
        n.round()
        n = n / precisionNum
        return n
    }
}
