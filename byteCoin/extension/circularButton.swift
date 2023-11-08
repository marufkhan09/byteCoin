//
//  circularButton.swift
//  byteCoin
//
//  Created by Maruf Khan on 8/11/23.
//

import Foundation
import UIKit

extension UIButton {
    func makeCircular() {
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.size.width / 2
    }
}
