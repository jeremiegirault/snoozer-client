//
//  Date+Convert.swift
//  snoozer
//
//  Created by Jeremie Girault on 04/10/2016.
//
//

import Foundation

extension Date {
    
    private static func createDateTimeFormatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }
    
    private static func createDateFormatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        return formatter
    }
    
    private static let dateTimeFormatter = createDateTimeFormatter()
    private static let dateFormatter = createDateFormatter()
    
    var dateTimeString: String {
        return Date.dateTimeFormatter.string(from: self)
    }
    
    var dateString: String {
        return Date.dateFormatter.string(from: self)
    }
}

extension String {
    private static func createSnoozeDateTimeFormatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatter
    }
    
    private static func createSnoozeISOFormatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        return formatter
    }
    
    
    private static func createSnoozeDateFormatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }
    
    private static let snoozeDateTimeFormatter = createSnoozeDateTimeFormatter()
    private static let snoozeDateFormatter = createSnoozeDateFormatter()
    private static let snoozeISOFormatter = createSnoozeISOFormatter()
    
    
    var snoozeDate: Date? {
        let rv = String.snoozeDateTimeFormatter.date(from: self) ?? String.snoozeDateFormatter.date(from: self) ?? String.snoozeISOFormatter.date(from: self)
        if rv == nil {
            print("ERROR \(self)")
        }
        return rv
    }
}
