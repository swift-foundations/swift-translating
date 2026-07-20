//
//  TranslatedString.swift
//  swift-translating
//
//  Translation vocabulary constants.
//
//  These constants construct via `Translated.init(default:dictionary:)` — the
//  authored dictionaries are stored as written. They previously rode the
//  \.languages-filtering mass initializer, which made each `static let`'s
//  content permanently dependent on whichever dependency context touched it
//  FIRST (lazy static initialization baked the ambient filter — a race dressed
//  as a constant). That first-access-baking defect was removed in the W3
//  decomposition; the filtering initializer now lives in
//  swift-translating-dependencies.
//

public import Translating

extension TranslatedString {
    public static let male: Self =
        .init(
            default: "male",
            dictionary: [
                .dutch: "man",
                .english: "male",
                .french: "mâle",
                .german: "Mann",
                .spanish: "masculino",
            ]
        )

    public static let female: Self =
        .init(
            default: "female",
            dictionary: [
                .dutch: "vrouw",
                .english: "female",
                .french: "femme",
                .german: "Frau",
                .spanish: "femenina",
            ]
        )

    public static let non_binary: Self =
        .init(
            default: "non binary",
            dictionary: [
                .dutch: "non-binair",
                .english: "non binary",
                .french: "non binaire",
                .german: "nicht binär",
                .spanish: "no binario",
            ]
        )

    public static let answer: Self =
        .init(
            default: "answer",
            dictionary: [
                .dutch: "antwoord",
                .english: "answer",
                .french: "répondre",
                .german: "antwort",
                .spanish: "respuesta",
            ]
        )

    public static let agree: Self =
        .init(
            default: "agree",
            dictionary: [
                .dutch: "eens",
                .english: "agree",
                .french: "convenu",
                .german: "stimmt",
                .spanish: "acordado",
            ]
        )

    public static let disagree: Self =
        .init(
            default: "disagree",
            dictionary: [
                .dutch: "oneens",
                .english: "disagree",
                .french: "désaccord",
                .german: "nein",
                .spanish: "discrepar",
            ]
        )

    public static let compact: Self =
        .init(
            default: "compact",
            dictionary: [
                .dutch: "compact",
                .english: "compact",
                .french: "compact",
                .german: "kompakt",
                .spanish: "compacto",
            ]
        )

    public static let complete: Self =
        .init(
            default: "complete",
            dictionary: [
                .dutch: "compleet",
                .english: "complete",
                .french: "complet",
                .german: "vollständig",
                .spanish: "completo",
            ]
        )

    public static let your_name: Self =
        .init(
            default: "your name",
            dictionary: [
                .dutch: "je naam",
                .english: "your name",
                .french: "votre nom",
                .german: "Ihren Namen",
                .spanish: "Su nombre",
            ]
        )

    public static let your_gender: Self =
        .init(
            default: "your gender",
            dictionary: [
                .dutch: "je geslacht",
                .english: "your gender",
                .french: "votre sexe",
                .german: "dein Geschlecht",
                .spanish: "tu género",
            ]
        )

    public static let select_an_option: Self =
        .init(
            default: "select an option",
            dictionary: [
                .dutch: "selecteer een keuze",
                .english: "select an option",
                .french: "choisir une option",
                .german: "Wähle eine Option",
                .spanish: "Seleccione una opción",
            ]
        )

    public static let gender: Self =
        .init(
            default: "gender",
            dictionary: [
                .dutch: "gender",
                .english: "gender",
                .french: "genre",
                .german: "Geschlecht",
                .spanish: "género",
            ]
        )

    public static let new: Self =
        .init(
            default: "New",
            dictionary: [
                .dutch: "Nieuw",
                .english: "New",
                .french: "Nouveau",
                .german: "Neue",
                .spanish: "Nuevo",
            ]
        )

    public static let language: Self =
        .init(
            default: "language",
            dictionary: [
                .dutch: "taal",
                .english: "language",
                .french: "langue",
                .german: "sprache",
                .spanish: "idioma",
            ]
        )

    public static let next: Self =
        .init(
            default: "next",
            dictionary: [
                .dutch: "volgende",
                .english: "next",
            ]
        )

    public static let subject: Self =
        .init(
            default: "subject",
            dictionary: [
                .dutch: "onderwerp",
                .english: "subject",
            ]
        )

    public static let date: Self =
        .init(
            default: "date",
            dictionary: [
                .dutch: "datum",
                .english: "date",
            ]
        )

    public static let name: Self =
        .init(
            default: "name",
            dictionary: [
                .dutch: "naam",
                .english: "name",
            ]
        )

    public static let `continue`: Self =
        .init(
            default: "continue",
            dictionary: [
                .dutch: "doorgaan",
                .english: "continue",
            ]
        )

    public static let `true`: Self =
        .init(
            default: "true",
            dictionary: [
                .dutch: "waar",
                .english: "true",
            ]
        )

    public static let `false`: Self =
        .init(
            default: "false",
            dictionary: [
                .dutch: "onwaar",
                .english: "false",
            ]
        )

    public static let and: Self =
        .init(
            default: "and",
            dictionary: [
                .dutch: "en",
                .english: "and",
                .french: "et",
                .german: "und",
                .italian: "e",
                .spanish: "y",
            ]
        )

    public static let or: Self =
        .init(
            default: "or",
            dictionary: [
                .dutch: "of",
                .english: "or",
                .french: "ou",
                .german: "oder",
                .italian: "o",
                .spanish: "o",
            ]
        )

    public static let title: Self =
        .init(
            default: "Title",
            dictionary: [
                .dutch: "Titel",
                .english: "Title",
                .french: "Titre",
                .german: "Titel",
                .spanish: "Título",
            ]
        )

    public static let delete: Self =
        .init(
            default: "delete",
            dictionary: [
                .dutch: "verwijder",
                .english: "delete",
                .french: "supprimer",
                .german: "löschen",
                .spanish: "borrar",
            ]
        )

    public static let done: Self =
        .init(
            default: "done",
            dictionary: [
                .dutch: "klaar",
                .english: "done",
                .french: "fini",
                .german: "fertig",
                .spanish: "finalizado",
            ]
        )

    public static let edit: Self =
        .init(
            default: "edit",
            dictionary: [
                .dutch: "wijzig",
                .english: "edit",
            ]
        )

    public static let in_progress: Self =
        .init(
            default: "in progress",
            dictionary: [
                .dutch: "bezig",
                .english: "in progress",
                .french: "en cours",
                .german: "im Gange",
                .spanish: "en curso",
            ]
        )

    public static let reset: Self =
        .init(
            default: "Reset",
            dictionary: [
                .dutch: "Reset",
                .english: "Reset",
                .french: "Reset",
                .german: "Reset",
                .spanish: "Reset",
            ]
        )

    public static let random: Self =
        .init(
            default: "random",
            dictionary: [
                .dutch: "andom",
                .english: "random",
                .french: "random",
                .german: "random",
                .spanish: "random",
            ]
        )

    public static let cancel: Self =
        .init(
            default: "cancel",
            dictionary: [
                .dutch: "annuleer",
                .english: "cancel",
                .french: "annuler",
                .german: "stornieren",
                .spanish: "cancelar",
            ]
        )

    public static let allow_changes: Self =
        .init(
            default: "allow changes",
            dictionary: [
                .dutch: "sta wijzigingen toe",
                .english: "allow changes",
                .french: "autoriser les modifications",
                .german: "Änderungen zulassen",
                .spanish: "permitir cambios",
            ]
        )

    public static let choose_true_or_false: Self =
        .init(
            default: "Choose true or false",
            dictionary: [
                .dutch: "Kies waar of onwaar",
                .english: "Choose true or false",
            ]
        )

    public static let cannot_undo: Self =
        .init(
            default: "you cannot undo this action",
            dictionary: [
                .dutch: "je kunt dit niet ongedaan maken",
                .english: "you cannot undo this action",
                .french: "vous ne pouvez pas annuler cette action",
                .german: "Sie können diese Aktion nicht rückgängig machen",
                .spanish: "no puedes deshacer esta acción",
            ]
        )

    public static let text_color: Self =
        .init(
            default: "text color",
            dictionary: [
                .dutch: "tekstkleur",
                .english: "text color",
                .french: "couleur du texte",
                .german: "textfarbe",
                .spanish: "color de texto",
            ]
        )

    public static let background_color: Self =
        .init(
            default: "background color",
            dictionary: [
                .dutch: "achtergrondkleur",
                .english: "background color",
                .french: "la couleur d'arrière-plan",
                .german: "hintergrundfarbe",
                .spanish: "color de fondo",
            ]
        )

    public var any: Self {
        let anyEnglish: String = {
            if let first = english.first {
                if Set<String>.vowels.contains(String(first).lowercased()) {
                    return "an \(english)"
                } else {
                    return "a \(english)"
                }
            }
            return english
        }()
        return .init(
            default: anyEnglish,
            dictionary: [
                .dutch: "een \(dutch)",
                .english: anyEnglish,
            ]
        )
    }

    public var the: Self {
        .init(
            default: "the \(english)",
            dictionary: [
                .dutch: "de \(dutch)",
                .english: "the \(english)",
            ]
        )
    }
}
