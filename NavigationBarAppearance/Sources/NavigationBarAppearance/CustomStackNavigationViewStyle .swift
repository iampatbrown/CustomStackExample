public struct CustomStackNavigationViewStyle: NavigationViewStyle {
  let defaultAppearance: NavigationBarAppearance?
  @State var navigationController: UINavigationController?

  public func _body(configuration: _NavigationViewStyleConfiguration) -> some View {
    NavigationView {
      if self.navigationController == nil {
        OnViewWillAppear { viewController in
          if let navigationController = viewController.navigationController {
            self.navigationController = navigationController
            self.navigationController!.set(appearance: self.defaultAppearance)
          } else {
            assertionFailure("UINavigationController should be present")
            self.navigationController = UINavigationController()
          }
        }
      } else {
        configuration.content
      }
    }
    .onPreferenceChange(PreferredNavigationBarAppearance.self) { appearance in
      self.navigationController?.set(appearance: appearance ?? self.defaultAppearance)
    }
    .navigationViewStyle(.stack)
  }

  public func _columnBasedBody(configuration: _NavigationViewStyleConfiguration) -> some View {
    self._body(configuration: configuration)
  }
}

extension NavigationViewStyle where Self == CustomStackNavigationViewStyle {
  public static var customStack: Self { .init(defaultAppearance: nil) }

  public static func customStack(defaultAppearance: NavigationBarAppearance) -> Self {
    .init(defaultAppearance: defaultAppearance)
  }
}
