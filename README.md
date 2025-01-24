# Phrase Over the Air (OTA) SDK for iOS

Publish your translations faster and simpler than ever before. Stop waiting for the next deployment and start publishing all your translations in real-time directly in Phrase Strings.

## Instructions

Head over to the Phrase Help Center to learn about this feature and how to use it in your apps: https://support.phrase.com/hc/en-us/articles/5804059067804

---


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
        } else {
            logger.debug("Translations remain unchanged")
        }
    } catch {
        logger.error("An error occurred: \(error)")
    }
}
```


