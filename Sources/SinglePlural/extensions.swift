//
//  File.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 19/07/2024.
//

import Foundation
import Language
import Translated
import TranslatedString

extension Translated<SinglePlural<String>> {
  public static let year: Self = [
    .dutch: .init(single: "jaar", plural: "jaren"),
    .english: .init(single: "year", plural: "years"),
    .french: .init(single: "année", plural: "ans"),
    .german: .init(single: "Jahr", plural: "Jahren"),
    .spanish: .init(single: "año", plural: "años"),
  ]
  public static let month: Self = [
    .dutch: .init(single: "maand", plural: "maanden"),
    .english: .init(single: "month", plural: "months"),
    .french: .init(single: "mois", plural: "mois"),
    .german: .init(single: "Monat", plural: "Monate"),
    .spanish: .init(single: "mes", plural: "meses"),
  ]

  public static let week: Self = [
    .dutch: .init(single: "week", plural: "weken"),
    .english: .init(single: "week", plural: "weeks"),
    .french: .init(single: "semaine", plural: "semaines"),
    .german: .init(single: "Woche", plural: "Wochen"),
    .spanish: .init(single: "semana", plural: "semanas"),
  ]

  public static let day: Self = [
    .dutch: .init(single: "dag", plural: "dagen"),
    .english: .init(single: "day", plural: "days"),
    .french: .init(single: "jour", plural: "jours"),
    .german: .init(single: "Tag", plural: "Tagen"),
    .spanish: .init(single: "día", plural: "días"),
  ]

  public static let hour: Self = [
    .dutch: .init(single: "uur", plural: "uren"),
    .english: .init(single: "hour", plural: "hours"),
    .french: .init(single: "heure", plural: "heures"),
    .german: .init(single: "Stunde", plural: "Stunden"),
    .spanish: .init(single: "hora", plural: "horas"),
  ]

  public static let minute: Self = [
    .dutch: .init(single: "minuut", plural: "minuten"),
    .english: .init(single: "minute", plural: "minutes"),
    .french: .init(single: "minute", plural: "minutes"),
    .german: .init(single: "Minute", plural: "Minuten"),
    .spanish: .init(single: "minuto", plural: "minutos"),
  ]

  public static let second: Self = [
    .dutch: .init(single: "seconde", plural: "seconden"),
    .english: .init(single: "second", plural: "seconds"),
    .french: .init(single: "minute", plural: "minutes"),
    .german: .init(single: "Sekunde", plural: "Sekunden"),
    .spanish: .init(single: "segundo", plural: "segundos"),
  ]
}

extension Int {
  public var years: TranslatedString {
    self.translations(.year)
  }

  public var months: TranslatedString {
    self.translations(
      .month
    )
  }

  public var weeks: TranslatedString {
    self.translations(
      .week
    )
  }

  public var days: TranslatedString {
    self.translations(
      .day
    )
  }

  public var hours: TranslatedString {
    self.translations(
      .hour
    )
  }

  public var minutes: TranslatedString {
    self.translations(
      .minute
    )
  }

  public var seconds: TranslatedString {
    self.translations(
      .second
    )
  }
}

extension Int? {
  public var hours: TranslatedString? {
    self?.hours
  }
}

extension Int {
  fileprivate func timeUnitString(single: TranslatedString, multiple: TranslatedString)
    -> TranslatedString
  {
    if self == 1 {
      return .init("\(self) ") + single
    } else {
      return .init("\(self) ") + multiple
    }
  }
}

extension SinglePlural where A == String {
  func `for`(_ int: Int) -> A {
    if int == 1 {
      return .init("\(int) ") + self.single
    } else {
      return .init("\(int) ") + self.plural
    }
  }
}

extension Int {
  func translations(_ translations: Translated<SinglePlural<String>>) -> TranslatedString {
    translations.map { singlePlural in
      singlePlural.for(self)
    }
  }
}

// extension Date.Time {
//    public func description() -> TranslatedString {
//        switch self {
//        case let .seconds(int): return int.seconds
//        case let .hours(int): return int.hours
//        case let .minutes(int): return int.minutes
//        case let .days(int): return int.days
//        case let .weeks(int): return int.weeks
//        case let .months(int): return int.months
//        case let .years(int): return int.years
//        }
//    }
// }
