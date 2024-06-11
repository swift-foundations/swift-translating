//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 22/04/2023.
//

import Foundation

public extension Languages.Language {
    var new: String { TranslatedString.new(self) }

    var date: String { TranslatedString.date(self) }

    var subject: String { TranslatedString.subject(self) }

    var `continue`: String { TranslatedString.continue(self) }

    var next: String { TranslatedString.next(self) }

    var `true`: String { TranslatedString.true(self) }

    var `false`: String { TranslatedString.false(self) }

    var and: String { TranslatedString.and(self) }

    var or: String { TranslatedString.or(self) }

    var language: String { TranslatedString.language(self) }

    var title: String { TranslatedString.title(self) }

//    var name:String { TranslatedString.name(self) }

    var delete: String { TranslatedString.delete(self) }

    var done: String { TranslatedString.done(self) }

    var edit: String { TranslatedString.edit(self) }

    var in_progress: String { TranslatedString.in_progress(self) }

    var allow_changes: String { TranslatedString.allow_changes(self) }

    var reset: String { TranslatedString.reset(self) }

    var random: String { TranslatedString.random(self) }

    var cancel: String { TranslatedString.cancel(self) }

    var cannotUndo: String { TranslatedString.cannotUndo(self) }

    var textColor: String { TranslatedString.textColor(self) }

    var backgroundColor: String { TranslatedString.backgroundColor(self) }

    var choose_true_or_false: String { TranslatedString.choose_true_or_false(self) }

    var answer: String { TranslatedString.answer(self) }

    var agree: String { TranslatedString.agree(self) }

    var disagree: String { TranslatedString.disagree(self) }

    var gender: String { TranslatedString.gender(self) }

    var compact: String { TranslatedString.compact(self) }

    var complete: String { TranslatedString.complete(self) }

    var your_name: String { TranslatedString.your_name(self) }

    var your_gender: String { TranslatedString.your_gender(self) }

    var select_an_option: String { TranslatedString.select_an_option(self) }
}
