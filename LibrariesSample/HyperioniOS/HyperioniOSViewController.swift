//
//  HyperioniOSViewController.swift
//  LibrariesSample
//
//  Created by Masato Takamura on 2021/09/12.
//

import UIKit

class HyperioniOSViewController: UIViewController {

    private var isAnimated = false

    @IBOutlet private weak var lightGrayView: UIView!
    @IBOutlet private weak var mediumGrayView: UIView!
    @IBOutlet private weak var darkGrayView: UIView!
    @IBOutlet private weak var blueView: UIView!

    @IBOutlet private weak var lightGrayLeftPosition: NSLayoutConstraint!
    @IBOutlet private weak var mediumGrayCenterPosition: NSLayoutConstraint!
    @IBOutlet private weak var darkGrayRightPosition: NSLayoutConstraint!

    @IBOutlet private weak var orderButton: UIButton! {
        didSet {
            orderButton.addTarget(
                self,
                action: #selector(didTapOrderButton(_:)),
                for: .touchUpInside)
        }
    }
    @IBOutlet private weak var changeShapeButton: UIButton! {
        didSet {
            changeShapeButton.addTarget(
                self,
                action: #selector(didTapChangeShapeButton(_:)),
                for: .touchUpInside)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

@objc
private extension HyperioniOSViewController {
    func didTapOrderButton(_ sender: UIButton) {
        isAnimated.toggle()
        if isAnimated {
            lightGrayLeftPosition.constant = 300
            UIView.animate(
                withDuration: 1.0,
                animations: {
                    self.view.layoutIfNeeded()
                },
                completion: { _ in
                    self.mediumGrayCenterPosition.constant = 200
                    UIView.animate(
                        withDuration: 1.0,
                        animations: {
                            self.view.layoutIfNeeded()
                        },
                        completion: { _ in
                            self.darkGrayRightPosition.constant = 100
                            UIView.animate(
                                withDuration: 1.0,
                                animations: {
                                    self.view.layoutIfNeeded()
                                }
                            )
                        }
                    )
                }
            )
        } else {
            lightGrayLeftPosition.constant = 8
            mediumGrayCenterPosition.constant = 0
            darkGrayRightPosition.constant = 8
            UIView.animate(
                withDuration: 1.0,
                animations: {
                    self.view.layoutIfNeeded()
                }
            )
        }
    }

    func didTapChangeShapeButton(_ sender: UIButton) {
        UIView.animate(withDuration: 1.0,
                       animations: {
                        self.blueView.layer.cornerRadius = self.blueView.frame.size.width / 2
                       },
                       completion: { _ in
                        UIView.animate(
                            withDuration: 1.0,
                            animations: {
                                self.blueView.layer.cornerRadius = 0
                            }
                        )
                       }
        )
    }
}
