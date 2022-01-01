//
//  BottomCardSegue.swift
//  LibrariesSample
//
//  Created by Masato Takamura on 2021/12/24.
//

import UIKit
import SwiftMessages

class BottomCardSegue: UIStoryboardSegue {

    private var selfRetainer: BottomCardSegue?

    override func perform() {
        destination.transitioningDelegate = self
        selfRetainer = self
        destination.modalPresentationStyle = .overCurrentContext
        source.present(destination, animated: true, completion: nil)
    }
}

extension BottomCardSegue: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        Presenter()
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        Dismisser()
    }
}

private class Presenter: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        0.5
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView
        let toView = transitionContext.view(forKey: .to)!
        let toViewController = transitionContext.viewController(forKey: .to)!
        // layout
        do {
            toView.translatesAutoresizingMaskIntoConstraints = false
            container.addSubview(toView)
            // minimum bottom margin 20pt
            let bottom = max(20 - toView.safeAreaInsets.bottom, 0)
            container.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: toView.bottomAnchor, constant: bottom).isActive = true
            container.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: toView.leadingAnchor, constant: -20).isActive = true
            container.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: toView.trailingAnchor, constant: 20).isActive = true
            if toViewController.preferredContentSize.height > 0 {
                toView.heightAnchor.constraint(equalToConstant: toViewController.preferredContentSize.height).isActive = true
            }
        }

        // style
        do {
            toView.layer.masksToBounds = true
            toView.layer.cornerRadius = 20
        }

        // animation
        do {
            container.layoutIfNeeded()
            let originalOriginY = toView.frame.origin.y
            toView.frame.origin.y += container.frame.height - toView.frame.minY
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: [],
                           animations: {
                            toView.frame.origin.y = originalOriginY
                           },
                           completion: { completed in
                            transitionContext.completeTransition(completed)
                           })
        }
    }
}

private class Dismisser: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        0.2
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView
        let fromView = transitionContext.view(forKey: .from)!
        UIView.animate(withDuration: 0.2,
                       animations: {
                        fromView.frame.origin.y += container.frame.height - fromView.frame.minY
                       },
                       completion: { completed in
                        transitionContext.completeTransition(completed)
                       })

    }

}
