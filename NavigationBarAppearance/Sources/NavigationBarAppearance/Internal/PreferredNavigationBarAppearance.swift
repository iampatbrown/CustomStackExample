struct PreferredNavigationBarAppearance: PreferenceKey {
  static var defaultValue: NavigationBarAppearance?
  
  static func reduce(
    value: inout NavigationBarAppearance?,
    nextValue: () -> NavigationBarAppearance?
  ) {
    guard let nextValue = nextValue() else { return }
    if let current = value {
      let backgroundColor = nextValue.backgroundColor ?? current.backgroundColor
      let tint = nextValue.tint ?? current.tint
      let titleColor = nextValue.titleColor ?? current.titleColor
      value!.backgroundColor = backgroundColor
      value!.tint = tint
      value!.titleColor = titleColor
    } else {
      value = nextValue
    }
  }
}
