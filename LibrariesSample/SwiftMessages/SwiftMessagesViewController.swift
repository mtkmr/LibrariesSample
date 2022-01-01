//
//  SwiftMessagesViewController.swift
//  LibrariesSample
//
//  Created by Masato Takamura on 2021/12/24.
//

import UIKit
import SwiftMessages

final class SwiftMessagesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SwiftMessages"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nc = segue.destination as! UINavigationController
        let rootVC = nc.viewControllers.first!
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(hide))
        rootVC.navigationItem.rightBarButtonItem = doneButton
    }

    @objc
    private func hide() {
        dismiss(animated: true, completion: nil)
    }

    @IBAction private func showProgramatically(_ sender: UIButton) {
        let bottomVC = storyboard!.instantiateViewController(withIdentifier: "Child")
        let segue = BottomCardSegue(identifier: nil, source: self, destination: bottomVC)
        prepare(for: segue, sender: nil)
        segue.perform()
    }

    @IBAction private func tappedShowCardViewButton(_ sender: UIButton) {
        let view = MessageView.viewFromNib(layout: .cardView)
        // テーマの設定
        view.configureTheme(.warning)
        // 影
        view.configureDropShadow()
        // 中身の構成
        let iconText = ["🤔", "😳", "🙄", "😶"].randomElement()!
        view.configureContent(title: "Warning", body: "Consider yourself warned.", iconText: iconText)
        // tap
        view.tapHandler = { _ in SwiftMessages.hide() }
        // margin
        view.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        // corner
        (view.backgroundView as? CornerRoundingView)?.cornerRadius = 10

        // 表示オプション
        var config = SwiftMessages.Config()
        // どこから表示させるか
        config.presentationStyle = .center
        // ウインドウレベルの指定
        config.presentationContext = .window(windowLevel: .statusBar)
        // iOS13以降では、.statusBarレベルで表示できず、以下のように処理する必要がある
        config.prefersStatusBarHidden = true
        // 閉じるまでの時間
        config.duration = .seconds(seconds: 2)
        // background
        config.dimMode = .none
        // pan-to-hide
        config.interactiveHide = true
        // メッセージをステータスバーの直下に表示する場合は、ステータスバーのスタイルを指定する
        config.preferredStatusBarStyle = .lightContent
        // 表示・非表示イベントに応答するイベントリスナー
        config.eventListeners.append { event in
            if case .didHide = event { print("yep") }
        }

        // Show the message.
        SwiftMessages.show(config: config, view: view)
    }
}
