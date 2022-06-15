public struct NavigationBarAppearance: Equatable {
  public var backgroundColor: Color?
  public var tint: Color?
  public var titleColor: Color?

  public init(
    backgroundColor: Color? = nil,
    tint: Color? = nil,
    titleColor: Color? = nil
  ) {
    self.backgroundColor = backgroundColor
    self.tint = tint
    self.titleColor = titleColor
  }
}
