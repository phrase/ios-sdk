# Phrase Over the Air (OTA) SDK for iOS

Publish your translations faster and simpler than ever before. Stop waiting for the next deployment and start publishing all your translations in real-time directly in Phrase Strings.

Head over to the Phrase Help Center to learn about this feature and how to use it in your apps: https://support.phrase.com/hc/en-us/articles/5804059067804

## Instructions

With the SDK, the app regularly checks for updated translations and downloads them in the background.

[Mac Catalyst](https://developer.apple.com/mac-catalyst) is also supported.

The SDK can be installed manually or via Swift Package Manager, Carthage or Cocoa Pods.

Example [app](https://github.com/phrase/ios-demo-app)

### Swift Package Manager
Add the public repository URL (https://github.com/phrase/ios-sdk/). Xcode automatically handles the rest of the installation.

### Carthage
Add the following line into your Cartfile:

```
binary "https://raw.githubusercontent.com/phrase/ios-sdk/master/PhraseSDK.json" ~> 5.0.0
```

Run `carthage update --use-xcframeworks` and add the `PhraseSDK.xcframework` to your project as described in the [Carthage documentation](https://github.com/Carthage/Carthage#if-youre-building-for-ios-tvos-or-watchos).

### Cocoa Pods
Add the following line into your Podfile:

```
pod 'PhraseSDK'
```
Run `pod install`. If new to CocoaPods, see their [documentation](https://guides.cocoapods.org/using/getting-started.html).

### Manual installation

1. Download the latest [release](https://github.com/phrase/ios-sdk/releases).
2. Add `PhraseSDK.xcframework` in Xcode as the linked binary to the target.

### Configuration

1. Import PhraseSDK
```
import PhraseSDK
```

2. Initialize the SDK
```
Phrase.shared.setup(
  distributionID: <Distribution ID>,
  environmentSecret: <Environment Secret>
)
```

3. Update translations

To update localization files call `Phrase.shared.updateTranslation()`. This method will raises an exception if SDK is not correctly setup.

To configure OTA to use the US data center, set the host before calling `PhraseApp.shared.updateTranslation()` with `Phrase.shared.configuration.apiHost = .us.`

Calling both functions within the `AppDelegate` in the `applicationDidFinishLaunchingWithOptions` method is recommended.

### Objective-C

Integrate the SDK into the Objective-C application:

```objective-c
@import PhraseSDK;

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  [[Phrase shared] setDebugMode:true]; // Optional

  [[Phrase shared] setupWithDistributionID:@"Your Distribution ID"
                         environmentSecret:@"Your Environment Secret"];

  // OR:
  //
  //  [[Phrase shared] setupWithDistributionID:@"Your Distribution ID"
  //                         environmentSecret:@"Your Environment Secret"
  //                                   timeout:10];

  // Update translations using callback block:
  [[Phrase shared] updateTranslationsWithCompletionHandler:^(BOOL updated, NSError* error){
    NSLog(@"Updated: %@", updated ? @"true" : @"false");

    if (error) {
      NSLog(@"Domain: %@ Code: %ld Message: %@", error.domain, (long)error.code, error.localizedDescription);
    } else {
      NSLog(@"No error");
    }

    // Translate via bundle proxy:
    NSString *translation = NSLocalizedString(@"layouts.application.about", @"");
    NSLog(@"NSLocalizedString via bundle proxy: %@", translation);

    // OR:
    //
    // Translate using fallback method:
    NSString *otherTranslation = [[Phrase shared]
                                  localizedStringForKey:@"layouts.application.about" value:NULL table:NULL];
    NSLog(@"Phrase.shared localizedStringForKey: %@", otherTranslation);
  }];

  // OR:
  //
  // [[Phrase shared] updateTranslationsWithCompletionHandler:NULL]; // ignore result and errors (not recommended)

  // [...] Your other code

  return YES;
}
```

### Apply updates

After updating the translations with `updateTranslation` call `applyPendingUpdates` to make the newly downloaded translations available immediately—without needing to restart the app.

> ℹ️ **Note:** If `applyPendingUpdates` is not called, the new translations will still be applied automatically on the next app launch.

```
let newUpdatesAvailable = try await Phrase.shared.updateTranslation()
if newUpdatesAvailable {
    Phrase.shared.applyPendingUpdates()
    // refresh the screen if needed
}

```

### Disable swizzling

To disable swizzling, set `PhraseSDKMainBundleProxyDisabled` to **YES** in the `Info.plist` file.

When swizzling is disabled, updated translations are no longer be displayed. The translation will still be synced if `updateTranslation` is called and can be accessed with the Phrase.`localizedString()` method.

### App version handling

To determine which release should be returned the SDK requires a semantic version of the app so translations are updated.

The SDK attempts to get a semantic version the following way:

- `CFBundleShortVersionString` is used if semantic.
- If not, `CFBundleVersion` is used if semantic.
- If both are not semantic, a combination of (`CFBundleShortVersionString.CFBundleVersion`) is used.

If `CFBundleShortVersionString` is missing or unable to be created with a semantic version together with `CFBundleVersion`, the SDK throws the `PhraseSetupError.appVersionNotSemantic` message.

### Disable translation for multiple tables

To prevent OTA from translating any tables in the main iOS bundle other than the default `Localizable` table, set the following option:

```
Phrase.shared.configuration.ignoreOtherTables = true
```

### Callbacks

Attach a callback handler to handle successful translation updates:

```swift
do {
   let updated = try await Phrase.shared.updateTranslation()
} catch error {
   ...
}
```

### Debug mode

If further information is required, enable the debug mode to get additional logging of the `PhraseSDK.framework` into the console:

```
Phrase.shared.configuration.debugMode = true
```

### Set timeout for requests

Set a timeout for the requests against Phrase by calling:

```
Phrase.shared.configuration.timeout = TimeInterval(20)
```

The default timeout is 10 seconds and connections taking longer than 10 seconds will be closed.

### Provide manual language override

If not using the system language as the locale, a different locale can be set in the init call. The locale code needs to be present in a release from Phrase:

```
Phrase.shared.configuration.localeOverride = "en-US"
```

### Fallback

In case new translations cannot be fetched from Phrase via the SDK, the latest translation files that the installation received are used. If the App never received new files from Phrase, it uses the compiled translation files of app. This prevents errors in case of any technical difficulties or networking errors. Keeping your translation files that are compiled into the app up to date with every release is recommended.

### Troubleshooting

**If translations are not being updated:**
- Ensure distribution id and environment secret are correct.
- Ensure a release was created on for the current app version.

If the wrong version of a translation is being used, ensure a release with the latest translations and the current app version is available.

### Auditing
The SDK is closed source and can not be viewed or modified. If it is an organization requirement, audits can be provided. [Contact us](https://phrase.com/contact/) for more details if required.

## Migration Guide: From Version 4.x.x to 5.x.x

### Before You Begin

Here’s what you need to know before updating to SDK `5.x.x`:

- The minimum supported iOS version for SDK `5.x.x` is **iOS 15.0**.
- SDK `5.x.x` requires **Swift 6.0** or later.

---

### Changed update function

In version `4.x.x`, the `updateTranslation` function was implemented using a callback-based approach.

```swift
do {
    try Phrase.shared.updateTranslation { result in
        switch result {
        case let .success(translationChanged):
            if translationChanged {
                logger.info("Translations changed")
            } else {
                logger.debug("Translations remain unchanged")
            }
        case let .failure(error):
            logger.error("An error occurred: \(error)")
        }
    }
} catch {
    logger.error("Unexpected error: \(error)")
}
```

In version `5.x.x`, this method has been updated to leverage Swift's modern concurrency model and is now implemented using `async/await`.

```swift
Task {
    do {
        let updated = try await Phrase.shared.updateTranslation()
        if updated {
            logger.info("Translations changed")
            // Starting with 5.1.0, it is possible to apply the new translation immediately
            Phrase.shared.applyPendingUpdates()
        } else {
            logger.debug("Translations remain unchanged")
        }
    } catch {
        logger.error("An error occurred: \(error)")
    }
}
```

### Limitations

**SwiftUI string-literal `Text` isn’t auto-intercepted**

SwiftUI resolves string literals via `LocalizedStringKey` (not the Foundation bundle lookup path that Phrase hooks into). As a result, `Text("my_key")` and other `LocalizedStringKey` initializers like `LocalizedStringResource` won’t automatically pick up OTA updates. Use a `String` that you obtain from `Phrase.shared.localizedString(_:)`, or use `NSLocalizedString`.

**Automatic replacement targets the main bundle**

Phrase’s swizzled lookups operate in the main bundle. Strings loaded from other bundles (e.g., frameworks or SPM modules) aren’t automatically replaced and may appear stale unless you resolve them explicitly via `Phrase.shared.localizedString(_:)`.

**Disabling swizzling disables auto-replacement**
If you set `PhraseSDKMainBundleProxyDisabled=YES` in `Info.plist`, OTA updates won’t appear via `NSLocalizedString` calls. Translations still sync. Access them explicitly with `Phrase.shared.localizedString(_:)` if you choose to run without swizzling.

**Semantic app version required for release selection**
The SDK selects the correct OTA release using your app version. If the version isn’t semantic, the SDK throws `PhraseSetupError.appVersionNotSemantic`. Ensure `CFBundleShortVersionString/CFBundleVersion` use semantic versioning (e.g., 1.2.3).

**Updated translations are shown on the next restart by default**

Translations are fetched in the background and shown on the next restart. This can be solved by applying updates immediately after [successful updates](https://github.com/phrase/ios-sdk?tab=readme-ov-file#apply-updates).


### Tips and Suggestions

- After fetching updates (e.g., by awaiting `Phrase.shared.updateTranslation()`), call `Phrase.shared.applyPendingUpdates()` and re-render affected views so that new strings appear immediately (especially in SwiftUI).
- For module or framework resources, prefer explicit lookups with `Phrase.shared.localizedString(_:)`, or consolidate UI strings into the main bundle where feasible.