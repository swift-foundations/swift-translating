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
import ToolKit_Custom

public extension Translated<SinglePlural<String>> {
    static let year: Self = .init(
        dutch: .init(single: "jaar", plural: "jaren"),
        english: .init(single: "year", plural: "years"),
        french: .init(single: "année", plural: "ans"),
        german: .init(single: "Jahr", plural: "Jahren"),
        spanish: .init(single: "año", plural: "años")
    )

    static let month: Self = .init(
        dutch: .init(single: "maand", plural: "maanden"),
        english: .init(single: "month", plural: "months"),
        french: .init(single: "mois", plural: "mois"),
        german: .init(single: "Monat", plural: "Monate"),
        spanish: .init(single: "mes", plural: "meses")
    )

    static let week: Self = .init(
        dutch: .init(single: "week", plural: "weken"),
        english: .init(single: "week", plural: "weeks"),
        french: .init(single: "semaine", plural: "semaines"),
        german: .init(single: "Woche", plural: "Wochen"),
        spanish: .init(single: "semana", plural: "semanas")
    )

    static let day: Self = .init(
        dutch: .init(single: "dag", plural: "dagen"),
        english: .init(single: "day", plural: "days"),
        french: .init(single: "jour", plural: "jours"),
        german: .init(single: "Tag", plural: "Tagen"),
        spanish: .init(single: "día", plural: "días")
    )

    static let hour: Self = .init(
        dutch: .init(single: "uur", plural: "uren"),
        english: .init(single: "hour", plural: "hours"),
        french: .init(single: "heure", plural: "heures"),
        german: .init(single: "Stunde", plural: "Stunden"),
        spanish: .init(single: "hora", plural: "horas")
    )

    static let minute: Self = .init(
        dutch: .init(single: "minuut", plural: "minuten"),
        english: .init(single: "minute", plural: "minutes"),
        french: .init(single: "minute", plural: "minutes"),
        german: .init(single: "Minute", plural: "Minuten"),
        spanish: .init(single: "minuto", plural: "minutos")
    )

    static let second: Self = .init(
        dutch: .init(single: "seconde", plural: "seconden"),
        english: .init(single: "second", plural: "seconds"),
        french: .init(single: "minute", plural: "minutes"),
        german: .init(single: "Sekunde", plural: "Sekunden"),
        spanish: .init(single: "segundo", plural: "segundos")
    )
}


public extension Int {
    var years: TranslatedString {
        self.translations(.year)
    }

    var months: TranslatedString {
        self.translations(
            .month
        )
    }

    var weeks: TranslatedString {
        self.translations(
            .week
        )
    }

    var days: TranslatedString {
        self.translations(
            .day
        )
    }

    var hours: TranslatedString {
        self.translations(
            .hour
        )
    }

    var minutes: TranslatedString {
        self.translations(
            .minute
        )
    }

    var seconds: TranslatedString {
        self.translations(
            .second
        )
    }
}

public extension Optional<Int> {
    var hours: TranslatedString? {
        self?.hours
    }
}



private extension Int {
    func timeUnitString(single: TranslatedString, multiple: TranslatedString) -> TranslatedString {
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

extension Date.Time {
    public func description() -> TranslatedString {
        switch self {
        case let .seconds(int): return int.seconds
        case let .hours(int): return int.hours
        case let .minutes(int): return int.minutes
        case let .days(int): return int.days
        case let .weeks(int): return int.weeks
        case let .months(int): return int.months
        case let .years(int): return int.years
        }
    }
}
