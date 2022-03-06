# This is a fork a the famous [DashChat library](https://github.com/fayeed/dash_chat)
It is no longer maintained and the other forks do not seem to be as reliable as the original library.
Therefore I created my own fork to add the feature that I want.
Thanks to [Fayeed](https://github.com/fayeed) who created the v1 of this package: https://github.com/fayeed/dash_chat and made that possible!

## Usage

To use this package, add `dash_chat` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).
```yaml
dependencies:
  new_version:
    git:
    url: https://github.com/LostInDarkMath/dash_chat.git
```

## Features that were already in the original package
- Fully customizable components
- Copy messages to clipboard
- Multi-line TextInput
- Touchable links using [flutter_parsed_text](https://pub.dev/packages/flutter_parsed_text)
- Avatar as user's initials
- Quick Reply messages
- Load earlier messages
- Scroll to bottom Widget

## Features that were NOT included in the original package
- Added validation by making `onSend` returning a `Future<bool>` which indicates if the message input field should be cleared.

## License ⚖️

- [MIT](https://github.com/LostInDarkMath/dash_chat/blob/master/LICENSE)

## Issues and feedback 💭

If you have any suggestion for including a feature or if something doesn't work, feel free to open a Github [issue](https://github.com/LostInDarkMath/dash_chat/issues) for us to have a discussion on it.
