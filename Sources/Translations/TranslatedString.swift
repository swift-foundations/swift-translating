//
//  File.swift
//  swift-translating
//
//  Created by Coen ten Thije Boonkkamp on 25/07/2025.
//

import Foundation

public extension TranslatedString {

    @inlinable static var male: Self {
        .init(
            dutch: "man",
            english: "male",
            french: "mâle",
            german: "Mann",
            spanish: "masculino"
        )
    }

    @inlinable static var female: Self {
        .init(
            dutch: "vrouw",
            english: "female",
            french: "femme",
            german: "Frau",
            spanish: "femenina"
        )
    }

    @inlinable static var non_binary: Self {
        .init(
            dutch: "non-binair",
            english: "non binary",
            french: "non binaire",
            german: "nicht binär",
            spanish: "no binario"
        )
    }

    @inlinable static var answer: Self {
        .init(
            dutch: "antwoord",
            english: "answer",
            french: "répondre",
            german: "antwort",
            spanish: "respuesta"
        )
    }

    @inlinable static var agree: Self {
        .init(
            dutch: "eens",
            english: "agree",
            french: "convenu",
            german: "stimmt",
            spanish: "acordado"
        )
    }

    @inlinable static var disagree: Self {
        .init(
            dutch: "oneens",
            english: "disagree",
            french: "désaccord",
            german: "nein",
            spanish: "discrepar"
        )
    }

    @inlinable static var compact: Self {
        .init(
            dutch: "compact",
            english: "compact",
            french: "compact",
            german: "kompakt",
            spanish: "compacto"
        )
    }

    @inlinable static var complete: Self {
        .init(
            dutch: "compleet",
            english: "complete",
            french: "complet",
            german: "vollständig",
            spanish: "completo"
        )
    }

    @inlinable static var your_name: Self {
        .init(
            dutch: "je naam",
            english: "your name",
            french: "votre nom",
            german: "Ihren Namen",
            spanish: "Su nombre"
        )
    }

    @inlinable static var your_gender: Self {
        .init(
            dutch: "je geslacht",
            english: "your gender",
            french: "votre sexe",
            german: "dein Geschlecht",
            spanish: "tu género"
        )
    }

    @inlinable static var select_an_option: Self {
        .init(
            dutch: "selecteer een keuze",
            english: "select an option",
            french: "choisir une option",
            german: "Wähle eine Option",
            spanish: "Seleccione una opción"
        )
    }

    @inlinable static var gender: Self {
        .init(
            dutch: "gender",
            english: "gender",
            french: "genre",
            german: "Geschlecht",
            spanish: "género"
        )
    }

    @inlinable static var new: Self {
        .init(
            dutch: "Nieuw",
            english: "New",
            french: "Nouveau",
            german: "Neue",
            spanish: "Nuevo"
        )
    }

    @inlinable static var language: Self {
        .init(
            dutch: "taal",
            english: "language",
            french: "langue",
            german: "sprache",
            spanish: "idioma"
        )
    }

    @inlinable static var next: Self {
        .init(
            dutch: "volgende",
            english: "next"
        )
    }

    @inlinable static var subject: Self {
        .init(
            dutch: "onderwerp",
            english: "subject"
        )
    }

    @inlinable static var date: Self {
        .init(
            dutch: "datum",
            english: "date"
        )
    }

    @inlinable static var name: Self {
        .init(
            dutch: "naam",
            english: "name"
        )
    }

    @inlinable static var `continue`: Self {
        .init(
            dutch: "doorgaan",
            english: "continue"
        )
    }

    @inlinable static var `true`: Self {
        .init(
            dutch: "waar",
            english: "true"
        )
    }

    @inlinable static var `false`: Self {
        .init(
            dutch: "onwaar",
            english: "false"
        )
    }

    @inlinable static var and: Self {
        .init(
            dutch: "en",
            english: "and",
            french: "et",
            german: "und",
            italian: "e",
            spanish: "y"
        )
    }

    @inlinable static var or: Self {
        .init(
            dutch: "of",
            english: "or",
            french: "ou",
            german: "oder",
            italian: "o",
            spanish: "o"
        )
    }

    @inlinable static var title: Self {
        .init(
            dutch: "Titel",
            english: "Title",
            french: "Titre",
            german: "Titel",
            spanish: "Título"
        )
    }

    @inlinable static var delete: Self {
        .init(
            dutch: "verwijder",
            english: "delete",
            french: "supprimer",
            german: "löschen",
            spanish: "borrar"
        )
    }

    @inlinable static var done: Self {
        .init(
            dutch: "klaar",
            english: "done",
            french: "fini",
            german: "fertig",
            spanish: "finalizado"
        )
    }

    @inlinable static var edit: Self {
        .init(
            dutch: "wijzig",
            english: "edit"
        )
    }

    @inlinable static var in_progress: Self {
        .init(
            dutch: "bezig",
            english: "in progress",
            french: "fini",
            german: "im Gange",
            spanish: "en curso"
        )
    }

    @inlinable static var reset: Self {
        .init(
            dutch: "Reset",
            english: "Reset",
            french: "Reset",
            german: "Reset",
            spanish: "Reset"
        )
    }

    @inlinable static var random: Self {
        .init(
            dutch: "andom",
            english: "random",
            french: "random",
            german: "random",
            spanish: "random"
        )
    }

    @inlinable static var cancel: Self {
        .init(
            dutch: "annuleer",
            english: "cancel",
            french: "annuler",
            german: "stornieren",
            spanish: "cancelar"
        )
    }

    @inlinable static var allow_changes: Self {
        .init(
            dutch: "sta wijzigingen toe",
            english: "allow changes",
            french: "autoriser les modifications",
            german: "Änderungen zulassen",
            spanish: "permitir cambios"
        )
    }

    @inlinable static var choose_true_or_false: Self {
        .init(
            dutch: "Kies waar of onwaar",
            english: "Choose true or false"
        )
    }

    @inlinable static var cannot_undo: Self {
        .init(
            dutch: "je kunt dit niet ongedaan maken",
            english: "you cannot undo this action",
            french: "vous ne pouvez pas annuler cette action",
            german: "Sie können diese Aktion nicht rückgängig machen",
            spanish: "no puedes deshacer esta acción"
        )
    }

    @inlinable static var text_color: Self {
        .init(
            dutch: "tekstkleur",
            english: "text color",
            french: "couleur du texte",
            german: "textfarbe",
            spanish: "color de texto"
        )
    }

    @inlinable static var background_color: Self {
        .init(
            dutch: "achtergrondkleur",
            english: "background color",
            french: "la couleur d'arrière-plan",
            german: "hintergrundfarbe",
            spanish: "color de fondo"
        )
    }

    var any: Self {
        .init(
            dutch: "een \(dutch)",
            english: {
                if let first = english.first {
                    if Set<String>.vowels.contains(String(first).lowercased()) {
                        return "an \(english)"
                    } else {
                        return "a \(english)"
                    }
                }
                return english
            }()
        )
    }

    var the: Self {
        .init(
            dutch: "de \(dutch)",
            english: "the \(english)"
        )
    }
}
