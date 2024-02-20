import SwiftUI

struct Examples {

    /**
     When you create a localized string or a localized attributed string with an initializer that takes String.LocalizationValue, those initializers lookup the localized string immediately.

     Traits:
     - Picked up by string catalog automatically
     - No access to the key
     - Part of the Swift standard library
     - No directly supported initializer on e.g. `SwiftUI.Text`
     - Locale NOT reflected in SwiftUI previews
     */
    let a = Swift.String.LocalizationValue("Hello Ali")

    /**
     Initializers for several SwiftUI types – such as Text, Toggle, Picker and others – implicitly look up a localized string when you provide a string literal.

     Traits:
     - Picked up by string catalog automatically
     - No access to the key
     - Part of `SwiftUI`
     - Locale reflected in SwiftUI previews
     */
    let b = SwiftUI.LocalizedStringKey("Hello Boa")

    /**
     Use `Foundation.LocalizedStringResource` to provide localizable strings with lookups you defer to a later time.

     Traits:
     - Picked up by string catalog automatically
     - Access to the key
     - Part of `Foundation`
     - Takes parameters for e.g. comment, table, bundle
     - Locale reflected in SwiftUI previews
     */
    let c = Foundation.LocalizedStringResource("Hello Cecil", comment: "A short greeting")

    /**
     If you initialize a text view with a string literal, the view uses the init(_:tableName:bundle:comment:) initializer, which interprets the string as a localization key and searches for the key in the table you specify, or in the default table if you don’t specify one.

     Traits:
     - Picked up by string catalog automatically
     - No access to the key
     - Part of `SwiftUI`
     - Takes parameters for e.g. comment, table, bundle
     - Locale reflected in SwiftUI previews
     */
    let d = Text("Hello Dori", comment: "A short greeting")

    /**
     To explicitly bypass localization for a string literal, use the init(verbatim:) initializer.
     */
    let e = Text(verbatim: "Hello Emma")

    /**
     Returns a localized string from a table that Xcode generates for you when exporting localizations.

     Traits:
     - No access to the key (direct conversion into `String`)
     - Part of `Foundation`
     - Takes parameters for e.g. comment, table, bundle
     - Locale NOT reflected in SwiftUI previews
     */
    let f = Foundation.NSLocalizedString("Hello Fred", comment: "A short greeting")

    /**
     Traits:
     - NOT picked up by string catalog automatically
     - No access to the key (direct conversion into `String`)
     - Locale NOT reflected in SwiftUI previews
     */
    let g = "Hello Greta".localized

    /**
     Traits:
     - No access to the key (direct conversion into `String`)
     - Part of the Swift standard library
     - Takes parameters for e.g. comment, table, bundle
     - Locale NOT reflected in SwiftUI previews
     */
    let h = Swift.String(localized: "Hello Hero", comment: "A short greeting")
}

private extension String {
    var localized: Self {
        String(localized: LocalizedStringResource(stringLiteral: self))
    }
}




struct ContentView: View {
    
    let values = Examples()

    @Environment(\.locale) var locale

    var body: some View {
        VStack(alignment: .leading) {
            if let localizedLocaleIdentifier = locale.localizedString(forIdentifier: locale.identifier) {
                Text(verbatim: localizedLocaleIdentifier).bold()
            }

            Text(String(localized: values.a))

            Text(values.b)

            Text(values.c)

            values.d

            values.e

            Text(values.f)

            Text(values.g)

            Text(values.h)
        }
        .fontDesign(.monospaced)
        .padding()
        .border(Color.black)
    }
}

#Preview {
    Group {
        ContentView()
            .environment(\.locale, Locale(identifier: "en"))

        ContentView()
            .environment(\.locale, Locale(identifier: "de"))
    }
}








struct ExampleUsage {
    
    // MARK: - SwiftUI

    func localizedText(_ localizedStringValue: Swift.String.LocalizationValue) -> Text {
        Text(String(localized: localizedStringValue))
    }

    func localizedText(_ localizedStringKey: SwiftUI.LocalizedStringKey) -> Text {
        Text(localizedStringKey)
    }

    func localizedText(_ localizedStringResource: Foundation.LocalizedStringResource) -> Text {
        Text(localizedStringResource)
    }


    // MARK: - UIKit

    func localizedText(_ localizedStringValue: Swift.String.LocalizationValue) -> UILabel {
        let label = UILabel()
        label.text = String(localized: localizedStringValue)
        return label
    }

    func localizedLabel(_ localizedStringKey: SwiftUI.LocalizedStringKey) -> UILabel {
        let label = UILabel()
        label.text = nil // How to convert `SwiftUI.LocalizedStringKey` to `String`?
        return label
    }

    func localizedLabel(_ localizedStringResource: Foundation.LocalizedStringResource) -> UILabel {
        let label = UILabel()
        label.text = String(localized: localizedStringResource)
        return label
    }
}
