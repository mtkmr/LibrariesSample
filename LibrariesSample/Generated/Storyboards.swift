// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

// swiftlint:disable sorted_imports
import Foundation
import UIKit

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length implicit_return

// MARK: - Storyboard Scenes

// swiftlint:disable explicit_type_interface identifier_name line_length type_body_length type_name
internal enum StoryboardScene {
  internal enum ActiveLabel: StoryboardType {
    internal static let storyboardName = "ActiveLabel"

    internal static let initialScene = InitialSceneType<LibrariesSample.ActiveLabelViewController>(storyboard: ActiveLabel.self)
  }
  internal enum HyperioniOS: StoryboardType {
    internal static let storyboardName = "HyperioniOS"

    internal static let initialScene = InitialSceneType<LibrariesSample.HyperioniOSViewController>(storyboard: HyperioniOS.self)
  }
  internal enum IQKeyboardManager: StoryboardType {
    internal static let storyboardName = "IQKeyboardManager"

    internal static let initialScene = InitialSceneType<LibrariesSample.IQKeyboardManagerViewController>(storyboard: IQKeyboardManager.self)
  }
  internal enum Kingfisher: StoryboardType {
    internal static let storyboardName = "Kingfisher"

    internal static let initialScene = InitialSceneType<LibrariesSample.KingfisherViewController>(storyboard: Kingfisher.self)
  }
  internal enum LaunchScreen: StoryboardType {
    internal static let storyboardName = "LaunchScreen"

    internal static let initialScene = InitialSceneType<UIKit.UIViewController>(storyboard: LaunchScreen.self)
  }
  internal enum Lottie: StoryboardType {
    internal static let storyboardName = "Lottie"

    internal static let initialScene = InitialSceneType<LibrariesSample.LottieViewController>(storyboard: Lottie.self)
  }
  internal enum Main: StoryboardType {
    internal static let storyboardName = "Main"

    internal static let initialScene = InitialSceneType<UIKit.UINavigationController>(storyboard: Main.self)
  }
  internal enum Pkhud: StoryboardType {
    internal static let storyboardName = "PKHUD"

    internal static let initialScene = InitialSceneType<LibrariesSample.PKHUDViewController>(storyboard: Pkhud.self)
  }
  internal enum SwiftMessages: StoryboardType {
    internal static let storyboardName = "SwiftMessages"

    internal static let initialScene = InitialSceneType<LibrariesSample.SwiftMessagesViewController>(storyboard: SwiftMessages.self)

    internal static let child = SceneType<UIKit.UINavigationController>(storyboard: SwiftMessages.self, identifier: "Child")
  }
  internal enum SwiftyAttribute: StoryboardType {
    internal static let storyboardName = "SwiftyAttribute"

    internal static let initialScene = InitialSceneType<LibrariesSample.SwiftyAttributeViewController>(storyboard: SwiftyAttribute.self)
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length type_body_length type_name

// MARK: - Implementation Details

internal protocol StoryboardType {
  static var storyboardName: String { get }
}

internal extension StoryboardType {
  static var storyboard: UIStoryboard {
    let name = self.storyboardName
    return UIStoryboard(name: name, bundle: BundleToken.bundle)
  }
}

internal struct SceneType<T: UIViewController> {
  internal let storyboard: StoryboardType.Type
  internal let identifier: String

  internal func instantiate() -> T {
    let identifier = self.identifier
    guard let controller = storyboard.storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
      fatalError("ViewController '\(identifier)' is not of the expected class \(T.self).")
    }
    return controller
  }

  @available(iOS 13.0, tvOS 13.0, *)
  internal func instantiate(creator block: @escaping (NSCoder) -> T?) -> T {
    return storyboard.storyboard.instantiateViewController(identifier: identifier, creator: block)
  }
}

internal struct InitialSceneType<T: UIViewController> {
  internal let storyboard: StoryboardType.Type

  internal func instantiate() -> T {
    guard let controller = storyboard.storyboard.instantiateInitialViewController() as? T else {
      fatalError("ViewController is not of the expected class \(T.self).")
    }
    return controller
  }

  @available(iOS 13.0, tvOS 13.0, *)
  internal func instantiate(creator block: @escaping (NSCoder) -> T?) -> T {
    guard let controller = storyboard.storyboard.instantiateInitialViewController(creator: block) else {
      fatalError("Storyboard \(storyboard.storyboardName) does not have an initial scene.")
    }
    return controller
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
