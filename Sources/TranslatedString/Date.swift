//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 19/07/2024.
//

import Foundation
import Language

extension Date {

    public static func placeholder() -> TranslatedString {
        .init(
            dutch: "__ ________________ 2021",
            english: "________________ __, 2021"
        )
    }
    
    public func english(dateStyle: DateFormatter.Style = .long, timeStyle: DateFormatter.Style = .none) -> String {
        return self.description(dateStyle: dateStyle, timeStyle: timeStyle).english
    }

    public func dutch(dateStyle: DateFormatter.Style = .long, timeStyle: DateFormatter.Style = .none) -> String {
        return self.description(dateStyle: dateStyle, timeStyle: timeStyle).dutch
    }


    public func description(dateStyle: DateFormatter.Style = .long, timeStyle: DateFormatter.Style = .none) -> TranslatedString {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = dateStyle
        dateFormatter.timeStyle = timeStyle

        fatalError()
        
//        
//        return .init { language in
//            dateFormatter
//                return dateFormatter.string(from: self)
//        }
        
        //        return .init(
        //            dutch: {dateFormatter.locale = Language.dutch.locale; return dateFormatter.string(from: self)}(),
        //            english: {dateFormatter.locale = Language.english.locale; return dateFormatter.string(from: self)}()
        //        )

//        return .init(
//            //            arabic: { dateFormatter.locale = Language.arabic.locale; return dateFormatter.string(from: self) } (),
//            //            bengali: { dateFormatter.locale = Language.bengali.locale; return dateFormatter.string(from: self) } (),
//            //            chinese: { dateFormatter.locale = Language.chinese.locale; return dateFormatter.string(from: self) } (),
//            //            danish: { dateFormatter.locale = Language.danish.locale; return dateFormatter.string(from: self) } (),
//            dutch: { dateFormatter.locale = Language.dutch.locale; return dateFormatter.string(from: self) }(),
//            english: { dateFormatter.locale = Language.english.locale; return dateFormatter.string(from: self) }(),
//            french: { dateFormatter.locale = Language.french.locale; return dateFormatter.string(from: self) }(),
//            german: { dateFormatter.locale = Language.german.locale; return dateFormatter.string(from: self) }(),
//            //            hindi: { dateFormatter.locale = Language.hindi.locale; return dateFormatter.string(from: self) } (),
//            //            indonesian: { dateFormatter.locale = Language.indonesian.locale; return dateFormatter.string(from: self) } (),
//            //            irish: { dateFormatter.locale = Language.irish.locale; return dateFormatter.string(from: self) } (),
//            //            italian: { dateFormatter.locale = Language.italian.locale; return dateFormatter.string(from: self) } (),
//            //            japanese: { dateFormatter.locale = Language.japanese.locale; return dateFormatter.string(from: self) } (),
//            //            javanese: { dateFormatter.locale = Language.javanese.locale; return dateFormatter.string(from: self) } (),
//            //            korean: { dateFormatter.locale = Language.korean.locale; return dateFormatter.string(from: self) } (),
//            //            polish: { dateFormatter.locale = Language.polish.locale; return dateFormatter.string(from: self) } (),
//            //            portuguese: { dateFormatter.locale = Language.portuguese.locale; return dateFormatter.string(from: self) } (),
//            //            romanian: { dateFormatter.locale = Language.romanian.locale; return dateFormatter.string(from: self) } (),
//            //            russian: { dateFormatter.locale = Language.russian.locale; return dateFormatter.string(from: self) } (),
//            //            slovak: { dateFormatter.locale = Language.slovak.locale; return dateFormatter.string(from: self) } (),
//            //            slovenian: { dateFormatter.locale = Language.slovenian.locale; return dateFormatter.string(from: self) } (),
//            spanish: { dateFormatter.locale = Language.spanish.locale; return dateFormatter.string(from: self) }()
//            //            swedish: { dateFormatter.locale = Language.swedish.locale; return dateFormatter.string(from: self) } (),
//            //            turkish: { dateFormatter.locale = Language.turkish.locale; return dateFormatter.string(from: self) } ()
//        )
    }
}

extension Date?  {
    public func description(dateStyle: DateFormatter.Style = .long, timeStyle: DateFormatter.Style = .none) -> TranslatedString {

        return .init { language in
            switch (dateStyle, timeStyle) {
            case (.none, .none):
                if let date = self {
                    return date.description(dateStyle: dateStyle, timeStyle: timeStyle)(language)
                } else {
                    return Date.placeholder()(language)
                }
            case (.none, _):
                if let date = self {
                    return date.description(dateStyle: dateStyle, timeStyle: timeStyle)(language)
                } else {
                    return "__:__))"
                }
            default:
                if let date = self {
                    return date.description(dateStyle: dateStyle, timeStyle: timeStyle)(language)
                } else {
                    return Date.placeholder()(language)
                }
            }
        }
    }
}
