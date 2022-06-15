import Foundation

extension CFRunLoop {
  static var main: CFRunLoop { CFRunLoopGetMain() }
  
  func asyncBeforeWaiting(order: CFIndex = 0, execute work: @escaping () -> Void) {
    let observer = CFRunLoopObserverCreateWithHandler(
      kCFAllocatorDefault,
      CFRunLoopActivity.beforeWaiting.rawValue,
      false,
      order
    ) { _, _ in work() }

    CFRunLoopAddObserver(self, observer, .commonModes)
  }
}
