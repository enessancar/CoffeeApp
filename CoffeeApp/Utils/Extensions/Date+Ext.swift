//
//  Date+Ext.swift
//  CoffeeApp
//
//  Created by Enes Sancar on 28.10.2023.
//

import UIKit

extension Date {
    func timeAgoDisplay() -> String {
        let calendar = Calendar.current
        let now = Date()
        let components = calendar.dateComponents([.second, .minute, .hour, .day, .weekOfMonth], from: self, to: now)

        if let day = components.day, day >= 2 {
            return "\(day)\(StringConstants.DateFormat.dayAgo)"
        }
        if let day = components.day, day >= 1 {
            return "1\(StringConstants.DateFormat.dayAgo)"
        }
        if let hour = components.hour, hour >= 1 {
            return "\(hour)\(StringConstants.DateFormat.hourAgo)"
        }
        if let minute = components.minute, minute >= 1 {
            return "\(minute)\(StringConstants.DateFormat.minuteAgo)"
        }
        if let second = components.second, second >= 3 {
            return "\(second)\(StringConstants.DateFormat.secondAgo)"
        }
        return StringConstants.DateFormat.now
    }
}
