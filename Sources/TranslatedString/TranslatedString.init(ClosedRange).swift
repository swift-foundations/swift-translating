//
//  File.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 21/07/2024.
//

import Foundation

extension TranslatedString {
    public init<Bound>(_ closedRange: ClosedRange<Bound>) where Bound:CustomStringConvertible {
        self = .init(
            
            
            abkhazian: "\(closedRange.lowerBound) инаркны \(closedRange.upperBound)",
            afar: "\(closedRange.lowerBound) kaxxa kee ta \(closedRange.upperBound)",
            afrikaans: "\(closedRange.lowerBound) tot en met \(closedRange.upperBound)",
            akan: "\(closedRange.lowerBound) kosi \(closedRange.upperBound)",
            albanian: "\(closedRange.lowerBound) deri më \(closedRange.upperBound)",
            amharic: "\(closedRange.lowerBound) እስከ \(closedRange.upperBound)",
            arabic: "\(closedRange.lowerBound) حتى \(closedRange.upperBound)",
            aragonese: "\(closedRange.lowerBound) hasta \(closedRange.upperBound)",
            armenian: "\(closedRange.lowerBound) մինչև \(closedRange.upperBound)",
            assamese: "\(closedRange.lowerBound) পৰ্যন্ত \(closedRange.upperBound)",
            auEnglish: "\(closedRange.lowerBound) up to and including \(closedRange.upperBound)",
            avaric: "\(closedRange.lowerBound) да \(closedRange.upperBound)",
            avestan: "\(closedRange.lowerBound) raoča \(closedRange.upperBound)",
            aymara: "\(closedRange.lowerBound) kuti \(closedRange.upperBound)",
            azerbaijani: "\(closedRange.lowerBound) qədər \(closedRange.upperBound)",
            bambara: "\(closedRange.lowerBound) ka kɔrɔfɛ \(closedRange.upperBound)",
            bashkir: "\(closedRange.lowerBound) тиклем \(closedRange.upperBound)",
            basque: "\(closedRange.lowerBound) arte \(closedRange.upperBound)",
            belarusian: "\(closedRange.lowerBound) да \(closedRange.upperBound) уключна",
            bengali: "\(closedRange.lowerBound) পর্যন্ত \(closedRange.upperBound)",
            bihari: "\(closedRange.lowerBound) लेके \(closedRange.upperBound)",
            bislama: "\(closedRange.lowerBound) kasem \(closedRange.upperBound)",
            bosnian: "\(closedRange.lowerBound) do \(closedRange.upperBound) uključujući",
            breton: "\(closedRange.lowerBound) betek \(closedRange.upperBound)",
            bulgarian: "\(closedRange.lowerBound) до \(closedRange.upperBound) включително",
            burmese: "\(closedRange.lowerBound) အထိ \(closedRange.upperBound)",
            catalan: "\(closedRange.lowerBound) fins a \(closedRange.upperBound)",
            caEnglish: "\(closedRange.lowerBound) up to and including \(closedRange.upperBound)",
            chamorro: "\(closedRange.lowerBound) hasta \(closedRange.upperBound)",
            chechen: "\(closedRange.lowerBound) до \(closedRange.upperBound) кIайла",
            chinese: "\(closedRange.lowerBound) 到 \(closedRange.upperBound)",
            chuvash: "\(closedRange.lowerBound) пирĕн \(closedRange.upperBound)",
            cornish: "\(closedRange.lowerBound) dhe \(closedRange.upperBound)",
            corsican: "\(closedRange.lowerBound) finu à \(closedRange.upperBound)",
            cree: "\(closedRange.lowerBound) êkâ wâskahikanê \(closedRange.upperBound)",
            croatian: "\(closedRange.lowerBound) do \(closedRange.upperBound) uključujući",
            danish: "\(closedRange.lowerBound) op til og med \(closedRange.upperBound)",
            dutch: "\(closedRange.lowerBound) tot en met \(closedRange.upperBound)",
            english: "\(closedRange.lowerBound) up to and including \(closedRange.upperBound)",
            french: "\(closedRange.lowerBound) jusqu'à et y compris \(closedRange.upperBound)",
            german: "\(closedRange.lowerBound) bis einschließlich \(closedRange.upperBound)",
            hindi: "\(closedRange.lowerBound) तक \(closedRange.upperBound)",
            indonesian: "\(closedRange.lowerBound) hingga \(closedRange.upperBound)",
            irish: "\(closedRange.lowerBound) go \(closedRange.upperBound)",
            italian: "\(closedRange.lowerBound) fino a \(closedRange.upperBound)",
            japanese: "\(closedRange.lowerBound) から \(closedRange.upperBound) まで",
            javanese: "\(closedRange.lowerBound) nganti \(closedRange.upperBound)",
            korean: "\(closedRange.lowerBound) 부터 \(closedRange.upperBound) 까지",
            polish: "\(closedRange.lowerBound) do \(closedRange.upperBound) włącznie",
            portuguese: "\(closedRange.lowerBound) até \(closedRange.upperBound)",
            romanian: "\(closedRange.lowerBound) până la \(closedRange.upperBound)",
            russian: "\(closedRange.lowerBound) до \(closedRange.upperBound) включительно",
            slovak: "\(closedRange.lowerBound) až po \(closedRange.upperBound)",
            slovenian: "\(closedRange.lowerBound) do vključno z \(closedRange.upperBound)",
            spanish: "\(closedRange.lowerBound) hasta \(closedRange.upperBound)",
            swedish: "\(closedRange.lowerBound) till och med \(closedRange.upperBound)",
            turkish: "\(closedRange.lowerBound) kadar \(closedRange.upperBound)"
//            esperanto: "\(closedRange.lowerBound) ĝis \(closedRange.upperBound)",
//            estonian: "\(closedRange.lowerBound) kuni \(closedRange.upperBound)",
//            ewe: "\(closedRange.lowerBound) si wo ɖe ɖo \(closedRange.upperBound)",
//            faroese: "\(closedRange.lowerBound) upp til \(closedRange.upperBound)",
//            fijian: "\(closedRange.lowerBound) me yacova \(closedRange.upperBound)",
//            finnish: "\(closedRange.lowerBound) asti \(closedRange.upperBound)",
//            galician: "\(closedRange.lowerBound) ata \(closedRange.upperBound)",
//            gaelicScottish: "\(closedRange.lowerBound) suas gu \(closedRange.upperBound)",
//            georgian: "\(closedRange.lowerBound) მდე \(closedRange.upperBound)",
//            greek: "\(closedRange.lowerBound) μέχρι και \(closedRange.upperBound)",
//            guarani: "\(closedRange.lowerBound) peve \(closedRange.upperBound)",
//            gujarati: "\(closedRange.lowerBound) સુધી \(closedRange.upperBound)",
//            haitianCreole: "\(closedRange.lowerBound) rive \(closedRange.upperBound)",
//            hausa: "\(closedRange.lowerBound) har zuwa \(closedRange.upperBound)",
//            hebrew: "\(closedRange.lowerBound) עד כולל \(closedRange.upperBound)",
//            herero: "\(closedRange.lowerBound) pe \(closedRange.upperBound)",
//            hiriMotu: "\(closedRange.lowerBound) go inap \(closedRange.upperBound)",
//            hungarian: "\(closedRange.lowerBound) -ig bezárólag \(closedRange.upperBound)",
//            icelandic: "\(closedRange.lowerBound) upp í \(closedRange.upperBound)",
//            ido: "\(closedRange.lowerBound) ĝis \(closedRange.upperBound)",
//            igbo: "\(closedRange.lowerBound) ruo \(closedRange.upperBound)",
//            interlingua: "\(closedRange.lowerBound) usque ad \(closedRange.upperBound)",
//            interlingue: "\(closedRange.lowerBound) usque ad \(closedRange.upperBound)",
//            inuktitut: "\(closedRange.lowerBound) tikillugu \(closedRange.upperBound)",
//            inupiak: "\(closedRange.lowerBound) unalu \(closedRange.upperBound)",
//            kannada: "\(closedRange.lowerBound) ಮತ್ತು \(closedRange.upperBound) ಒಳಗೊಂಡಂತೆ",
//            kanuri: "\(closedRange.lowerBound) har \(closedRange.upperBound)",
//            kashmiri: "\(closedRange.lowerBound) तइय \(closedRange.upperBound)",
//            kazakh: "\(closedRange.lowerBound) дейін \(closedRange.upperBound)",
//            khmer: "\(closedRange.lowerBound) រហូតដល់ \(closedRange.upperBound)",
//            kikuyu: "\(closedRange.lowerBound) ku \(closedRange.upperBound)",
//            kinyarwanda: "\(closedRange.lowerBound) kugeza \(closedRange.upperBound)",
//            kirundi: "\(closedRange.lowerBound) gushika \(closedRange.upperBound)",
//            kyrgyz: "\(closedRange.lowerBound) чейин \(closedRange.upperBound)",
//            komi: "\(closedRange.lowerBound) дӧра \(closedRange.upperBound)",
//            kongo: "\(closedRange.lowerBound) tee \(closedRange.upperBound)",
//            kurdish: "\(closedRange.lowerBound) heta \(closedRange.upperBound)",
//            kwanyama: "\(closedRange.lowerBound) ku \(closedRange.upperBound)",
//            lao: "\(closedRange.lowerBound) ຫາ \(closedRange.upperBound)",
//            latin: "\(closedRange.lowerBound) usque ad \(closedRange.upperBound)",
//            latvian: "\(closedRange.lowerBound) līdz \(closedRange.upperBound) ieskaitot",
//            limburgish: "\(closedRange.lowerBound) tot en met \(closedRange.upperBound)",
        )
    }
}









public extension ClosedRange where Bound:CustomStringConvertible {
    func description() -> TranslatedString {
        .init(self)
    }
}
