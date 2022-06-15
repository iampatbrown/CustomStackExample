extension View {
  public func navigationBarBackgroundColor(_ color: Color?) -> some View {
    transformPreference(PreferredNavigationBarAppearance.self) { appearance in
      if appearance == nil {
        appearance = .init(backgroundColor: color)
      } else if let color = color {
        appearance!.backgroundColor = color
      }
    }
  }

  public func navigationBarTitleColor(_ color: Color?) -> some View {
    transformPreference(PreferredNavigationBarAppearance.self) { appearance in
      if appearance == nil {
        appearance = .init(titleColor: color)
      } else if let color = color {
        appearance!.titleColor = color
      }
    }
  }

  public func navigationBarTint(_ tint: Color?) -> some View {
    transformPreference(PreferredNavigationBarAppearance.self) { appearance in
      if appearance == nil {
        appearance = .init(tint: tint)
      } else if let tint = tint {
        appearance!.tint = tint
      }
    }
  }
}
