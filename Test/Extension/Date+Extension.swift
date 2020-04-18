//
//  Date+Extension.swift
//  Test
//
//  Created by abdul on 18/04/20.
//  Copyright © 2020 abdul. All rights reserved.
//

import Foundation

extension Date {
    func getDateFormateby(_ input:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current //Set timezone that you want
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = input
        let timeStamp = dateFormatter.string(from: self)
        return timeStamp
    }
}
