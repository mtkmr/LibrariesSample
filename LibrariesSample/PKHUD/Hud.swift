//
//  Hud.swift
//  LibrariesSample
//
//  Created by Masato Takamura on 2021/08/31.
//

import PKHUD

enum Hud {
    static func showProgress() {
        DispatchQueue.main.async {
            PKHUD.sharedHUD.contentView = PKHUDProgressView(title: "title", subtitle: "subtitle")
            PKHUD.sharedHUD.userInteractionOnUnderlyingViewsEnabled = true
            PKHUD.sharedHUD.show()
            //            HUD.show(.progress)
        }
    }

    static func hide() {
        DispatchQueue.main.async {
            PKHUD.sharedHUD.hide(true)
            //            HUD.hide(animated: true)
        }
    }

    static func flashProgress() {
        DispatchQueue.main.async {
            HUD.flash(.progress)
        }
    }

    static func flashSuccess() {
        DispatchQueue.main.async {
            HUD.flash(.success)
        }
    }

    static func flashLabeledError(
        title: String,
        subtitle: String,
        delay: TimeInterval,
        completion: ((Bool) -> Void)? = nil
    ) {
        DispatchQueue.main.async {
            HUD.flash(.labeledError(title: title, subtitle: subtitle),
                      delay: delay,
                      completion: completion)
        }
    }

    static func flashLabeledSuccess(
        title: String,
        subtitle: String,
        delay: TimeInterval,
        completion: ((Bool) -> Void)? = nil
    ) {
        DispatchQueue.main.async {
            HUD.flash(.labeledSuccess(title: title, subtitle: subtitle),
                      delay: delay,
                      completion: completion)
        }
    }

    static func flashLabeledProgress(
        title: String,
        subtitle: String,
        delay: TimeInterval,
        completion: ((Bool) -> Void)? = nil
    ) {
        DispatchQueue.main.async {
            HUD.flash(.labeledProgress(title: title, subtitle: subtitle),
                      delay: delay,
                      completion: completion)
        }
    }

    static func flashLabelOnly(
        label: String,
        delay: TimeInterval,
        completion: ((Bool) -> Void)? = nil
    ) {
        DispatchQueue.main.async {
            HUD.flash(.label(label),
                      delay: delay,
                      completion: completion)
        }
    }

}
