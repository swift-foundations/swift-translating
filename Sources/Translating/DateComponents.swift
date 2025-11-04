//
//  File.swift
//  swift-translating
//
//  Created by Coen ten Thije Boonkkamp on 31/07/2025.
//

import Foundation
import SinglePlural

extension TranslatedString {
  private static let timeUnits:
    Translated<[(KeyPath<DateComponents, Int?>, SinglePlural<String>)]> = [
      .english: [
        (\.year, .init(single: "year", plural: "years")),
        (\.month, .init(single: "month", plural: "months")),
        (\.weekOfYear, .init(single: "week", plural: "weeks")),
        (\.day, .init(single: "day", plural: "days")),
        (\.hour, .init(single: "hour", plural: "hours")),
        (\.minute, .init(single: "minute", plural: "minutes")),
        (\.second, .init(single: "second", plural: "seconds")),
      ],
      .dutch: [
        (\.year, .init(single: "jaar", plural: "jaar")),
        (\.month, .init(single: "maand", plural: "maanden")),
        (\.weekOfYear, .init(single: "week", plural: "weken")),
        (\.day, .init(single: "dag", plural: "dagen")),
        (\.hour, .init(single: "uur", plural: "uur")),
        (\.minute, .init(single: "minuut", plural: "minuten")),
        (\.second, .init(single: "seconde", plural: "seconden")),
      ],
    ]

  public init(_ dateComponents: DateComponents) {
    self = .init(
      dutch: Self.timeUnits.dutch
        .compactMap { keyPath, unit -> String? in
          guard let value = dateComponents[keyPath: keyPath], value != 0 else { return nil }
          let form = value == 1 ? unit.single : unit.plural
          return "\(value) \(form)"
        }
        .joined(separator: " ")
        .nilIfEmpty ?? "0 seconden",

      english: Self.timeUnits.english
        .compactMap { keyPath, unit -> String? in
          guard let value = dateComponents[keyPath: keyPath], value != 0 else { return nil }
          let form = value == 1 ? unit.single : unit.plural
          return "\(value) \(form)"
        }
        .joined(separator: " ")
        .nilIfEmpty ?? "0 seconds"
    )
  }
}

extension String {
  fileprivate var nilIfEmpty: String? {
    isEmpty ? nil : self
  }
}
