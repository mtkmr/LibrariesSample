//
//  PKHUDViewController.swift
//  LibrariesSample
//
//  Created by Masato Takamura on 2021/08/31.
//

import UIKit

final class PKHUDViewController: UIViewController {

    @IBOutlet private weak var showButton: UIButton! {
        didSet {
            showButton.addTarget(self, action: #selector(didTapShowButton(_:)), for: .touchUpInside)
        }
    }
    @IBOutlet private weak var hideButton: UIButton! {
        didSet {
            hideButton.addTarget(self, action: #selector(didTapHideButton(_:)), for: .touchUpInside)
        }
    }
    @IBOutlet private weak var flashButton: UIButton! {
        didSet {
            flashButton.addTarget(self, action: #selector(didTapFlashButton(_:)), for: .touchUpInside)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "PKHUD"
    }
}

@objc
private extension PKHUDViewController {
    func didTapShowButton(_ sender: UIButton) {
        Hud.showProgress()
    }

    func didTapHideButton(_ sender: UIButton) {
        Hud.hide()
    }

    func didTapFlashButton(_ sender: UIButton) {
        Hud.flashSuccess()
    }
}
