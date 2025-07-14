<h1 align="center">
  RouterKit
  <br>
</h1>

<h4 align="center">SwiftUI Navigation Router</h4>
<div align="center">
  <img src="https://codecov.io/github/BerkSpar/router-kit/graph/badge.svg?token=FZJ11DUEYR"/>
</div>

</br>

<p align="center">
  <a href="#key-features">Key Features</a> •
  <a href="#how-to-use">How To Use</a> •
  <a href="#credits">Credits</a> •
  <a href="#license">License</a> •
  <a href="CHANGELOG.md">Changelog</a>
</p>

## Key Features

* **Protocol-Based Routing**: Define your routes using the Routable protocol for flexible and reusable navigation.
* **Dynamic View Management**: Push, pop, and replace views dynamically within the navigation stack.
* **Animated and Non-Animated Transitions**: Supports both animated and non-animated route transitions.
* **Root View Replacement**: Easily replace the root view and reset the navigation stack.
* **Navigation Stack Control**: Navigate through a NavigationStack, fully integrated with SwiftUI's native navigation system.
* **Optimized for SwiftUI**: Built with SwiftUI best practices, ensuring smooth and native integration.

## How To Use

To use this package, you can simply install using **Swift Package Manager** and following these steps:

- **Step 1**: Define your app's routes by conforming to the Routable protocol.

```swift
import SwiftUI

// Import the RouterKit to use in your project
import RouterKit

enum AppRoute: Routable {
    case login
    case home
    case profile(userID: String)
    case settings
    case detail(itemID: Int)
    
    // The builder property returns the corresponding view for each route.
    var view: any View {
        switch self {
            case .login: LoginView()
            case .home: HomeView()
            case .profile(let userID): ProfileView(userID: userID)
            case .settings: SettingsView()
            case .detail(let itemID): DetailView(itemID: itemID)
        }
    }
}
```

- **Step 2**: Setup the RouterView in your main view.

```swift
import SwiftUI

// Import the RouterKit to use in your project
import RouterKit

struct ContentView: View {
    var body: some View {
        // The RouterView is initialized with the root view of the app.
        RouterView<AppRoute>(rootView: .home)
    }
}
```

- **Step 3**: Use on each page you want.

```swift
import SwiftUI

// Import the RouterKit to use in your project
import RouterKit

struct HomeView: View {
    // Every view that was rendered by RouterView has a router inside
    @EnvironmentObject var router: Router<AppRoute>
    
    var body: some View {
        VStack {
            Button("Push view") {
                router.push(to: .profile(userID: '<user-id>'))
            }

            Button("Push view without animation") {
                router.push(to: .profile(userID: '<user-id>'), animate: false)
            }

            Button("Pop view") {
                router.pop()
            }

            Button("Pop to root view") {
                router.popToRoot()
            }

            Button("Replace root view to another") {
                router.replaceRootView(to: .settings)
            }
        }
    }
}
```

## Emailware

This project is an [emailware](https://en.wiktionary.org/wiki/emailware). Meaning, if you liked using this app or it has helped you in any way, I'd like you send me an email at <berkspar@gmail.com> about anything you'd want to say about this software. I'd really appreciate it!

## Credits

This package was created on [Apple Developer Academy](https://developeracademy.pucpr.br).

## Support

<a href="https://www.buymeacoffee.com/berkspar"><img src="https://img.buymeacoffee.com/button-api/?text=Buy me a coffee&emoji=☕&slug=berkspar&button_colour=5F7FFF&font_colour=ffffff&font_family=Poppins&outline_colour=000000&coffee_colour=FFDD00" /></a>

## You may also like...

- [Hub Finder](https://github.com/BerkSpar/hub_finder) - A social way to use Github
- [Bunnie](https://github.com/BerkSpar/bunnie) - Never forget what anime you are watching

## License

Apache

---

> [berkspar.com](https://www.berkspar.com) &nbsp;&middot;&nbsp;
> GitHub [@berkspar](https://github.com/berkspar) &nbsp;&middot;&nbsp;
> LinkedIn [in/berkspar](https://www.linkedin.com/in/berkspar) &nbsp;&middot;&nbsp;
