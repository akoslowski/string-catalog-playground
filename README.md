#  Localization with String Catalogs

## Resources

- [Localizing and varying text with a string catalog](https://developer.apple.com/documentation/xcode/localizing-and-varying-text-with-a-string-catalog)
- [Discover String Catalogs](https://developer.apple.com/videos/play/wwdc2023/10155)
- [Editing XLIFF and string catalog files](https://developer.apple.com/documentation/xcode/editing-xliff-and-string-catalog-files)

## Features

|ID|Type|SC compatible|SwiftUI|SwiftUI previews|UIKit|Key Access|Parameters|
|:-:|---|:-:|:-:|:-:|:-:|:-:|:-:|
|a|`Swift.String.LocalizationValue`    |✅|✅⚠️|❌|✅⚠️|❌|❌|
|b|`SwiftUI.LocalizedStringKey`        |✅|✅  |✅|❌  |❌|❌|
|c|`Foundation.LocalizedStringResource`|✅|✅  |✅|✅⚠️|✅|✅|
|d|`SwiftUI.Text`                      |✅|✅  |✅|❌  |❌|✅|
|f|`Foundation.NSLocalizedString`      |✅|✅  |❌|✅  |❌|✅|
|g|`String` extension                  |❌|✅  |❌|✅  |❌|❌|
|h|`String(localized:)`                |✅|✅  |❌|✅  |❌|✅|


### Legend
|Key|Description|
|---|---|
|ID|The variable name in the `Examples`|
|Type|The type to store a localizable key|
|SC compatible|The string catalog is automatically finding the specified keys in the project|
|SwiftUI|Do SwiftUI symbols come with an interface?|
|SwiftUI previews|Do SwiftUI previews automatically reflect the set locale?|
|UIKit|Do UIKit symbols come with an interface?|
|Key Access|Can the raw key be accessed, e.g. in tests|
|Parameters|Are parameters for choosing `comment`, `table`, `bundle` for the key available?|

- ⚠️ Some types can and need to be converted into `String` before using them in `UIKit`, or `SwiftUI`
    - `String(localized resource: LocalizedStringValue)`
    - `String(localized resource: LocalizedStringResource)`
