//
//  circularView.swift
//  byteCoin
//
//  Created by Maruf Khan on 8/11/23.
//

import Foundation


import UIKit

extension UIView {
    func roundCorners(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}
