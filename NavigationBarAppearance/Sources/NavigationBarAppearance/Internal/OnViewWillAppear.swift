struct OnViewWillAppear: UIViewControllerRepresentable {
  let viewWillAppear: (UIViewController) -> Void

  func makeUIViewController(context: UIViewControllerRepresentableContext<Self>) -> Controller {
    Controller(viewWillAppear: self.viewWillAppear)
  }

  func updateUIViewController(
    _ uiViewController: Controller,
    context: UIViewControllerRepresentableContext<Self>
  ) {}

  class Controller: UIViewController {
    var viewWillAppear: (UIViewController) -> Void

    init(viewWillAppear: @escaping (UIViewController) -> Void) {
      self.viewWillAppear = viewWillAppear
      super.init(nibName: nil, bundle: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      self.viewWillAppear(self)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
  }
}
