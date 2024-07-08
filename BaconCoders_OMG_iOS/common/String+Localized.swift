//
//  String+Localized.swift
//  BaconCoders_OMG_iOS
//
//  Created by 박병호 on 7/5/24.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
