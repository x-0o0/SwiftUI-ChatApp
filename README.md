# SwiftUI-ChatApp
Chat app using SendbirdChat Swift Package in SwiftUI

![Xcode screenshot](./screenshot_xcode.png)

![Simulator screenshot](./screenshot_simulator.png)

![Swift 5.5](https://img.shields.io/badge/Swift-5.5+-fa7343?style=for-the-badge&logo=swift&logoColor=white)
![SwiftUI 3](https://img.shields.io/badge/SwiftUI-3+-blue?style=for-the-badge&logo=swift&logoColor=white)
![Xcode 13 beta](https://img.shields.io/badge/Xcode-13_beta+-1575F9?style=for-the-badge&logo=xcode&logoColor=white)
![iOS 15+](https://img.shields.io/badge/iOS-15+-999999?style=for-the-badge&logo=apple&logoColor=white)

## Requirements

- Xcode 13 beta+
- iOS 15+

## Swift Package

### SendbirdChat

URL: https://github.com/jaesung-0o0/SwiftPackage-SendbirdChat

## Sign In

### View model

See `SendbirdChatState`

### View

`SignInView`

## Channel list

### View model

See `SendbirdChatState`

### View hierarchy

`ChannelList`
    - `ChannelRow`

## Channel

### View model

See `GroupChannelState`

### View hierarchy

`ChannelView`
    - `MessageList`
        - `MessageRow`
    - `MessageInputField`
