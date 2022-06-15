extension UINavigationController {
  func set(appearance: NavigationBarAppearance?) {
    if
      let appearance = appearance,
      appearance.backgroundColor != nil || appearance.tint != nil || appearance.titleColor != nil
    {
      // Capture current values
      let previousStandardAppearance = navigationBar.standardAppearance
      let previousCompactAppearance = navigationBar.compactAppearance
      let previousScrollEdgeAppearance = navigationBar.scrollEdgeAppearance
      let previousItemsCount = navigationBar.items?.count ?? 0
      let previousTopItem = navigationBar.topItem

      // Create new uiAppearances from appearance
      let newAppearance = UINavigationBarAppearance()

      if appearance.backgroundColor == .clear || appearance.backgroundColor == nil {
        newAppearance.configureWithTransparentBackground()
      } else if let backgroundColor = appearance.backgroundColor.map(UIColor.init) {
        newAppearance.backgroundColor = backgroundColor
      }

      if let titleColor = appearance.titleColor.map(UIColor.init) {
        newAppearance.titleTextAttributes = [.foregroundColor: titleColor]
        newAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor]
      }
      let newStandardAppearance = newAppearance
      let newCompactAppearance = newAppearance
      let newScrollEdgeAppearance = newAppearance
      let newTintColor = appearance.tint.map(UIColor.init)

      // Set appearances
      navigationBar.standardAppearance = newStandardAppearance
      navigationBar.compactAppearance = newCompactAppearance
      navigationBar.scrollEdgeAppearance = newScrollEdgeAppearance
      navigationBar.tintColor = newTintColor

      // TODO: I think it's better to set up an observer once inside CustomStackNavigationViewStyle
      // Wait for navigation state to change before applying appearance to top item
      CFRunLoop.main.asyncBeforeWaiting { [navigationBar, weak previousTopItem] in
        if navigationBar.items?.count ?? 0 > previousItemsCount {
          // Item count has increased so set the new top item's appearances
          navigationBar.topItem?.standardAppearance = newStandardAppearance
          navigationBar.topItem?.compactAppearance = newCompactAppearance
          navigationBar.topItem?.scrollEdgeAppearance = newScrollEdgeAppearance

          // Also set the previous top item's appearances
          previousTopItem?.standardAppearance = previousStandardAppearance
          previousTopItem?.compactAppearance = previousCompactAppearance
          previousTopItem?.scrollEdgeAppearance = previousScrollEdgeAppearance

          // Set the navigationBar back to the previous to help with animations ???
          navigationBar.standardAppearance = previousStandardAppearance
          navigationBar.compactAppearance = previousCompactAppearance
          navigationBar.scrollEdgeAppearance = previousScrollEdgeAppearance
        } else {
          navigationBar.standardAppearance = newStandardAppearance
          navigationBar.compactAppearance = newCompactAppearance
          navigationBar.scrollEdgeAppearance = newScrollEdgeAppearance

          navigationBar.topItem?.standardAppearance = .init()
          navigationBar.topItem?.compactAppearance = .init()
          navigationBar.topItem?.scrollEdgeAppearance = .init()
        }
      }

    } else {
      // TODO: Figure out real defaults
      CFRunLoop.main.asyncBeforeWaiting { [navigationBar] in
        navigationBar.standardAppearance = .init()
        navigationBar.compactAppearance = .init()
        navigationBar.scrollEdgeAppearance = .init()

        navigationBar.topItem?.standardAppearance = .init()
        navigationBar.topItem?.compactAppearance = .init()
        navigationBar.topItem?.scrollEdgeAppearance = .init()
      }
    }
  }
}
