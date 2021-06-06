//
//  ActiveLabelViewController.swift
//  LibrariesSample
//
//  Created by Masato Takamura on 2021/06/04.
//

import ActiveLabel
import UIKit

final class ActiveLabelViewController: UIViewController {
    private let activeLabel1 = ActiveLabel()
    private let activeLabel2 = ActiveLabel()
    private let activeLabel3 = ActiveLabel()
    private let activeLabel4 = ActiveLabel()
    @IBOutlet private var activeLabelContainerView1: UIView! {
        didSet {
            activeLabelContainerView1.addSubview(activeLabel1)
            activeLabel1.snp.makeConstraints { $0.edges.equalToSuperview() }
            activeLabel1.numberOfLines = 0
            activeLabel1.enabledTypes = [.mention]
            activeLabel1.text = "少しずつSwiftの言語仕様を分かってきました！\n　@mtkmr またお願いします。"
            activeLabel1.textColor = .black
            activeLabel1.mentionColor = .red
            activeLabel1.handleMentionTap { self.alert("mention", message: $0) }
        }
    }

    @IBOutlet private var activeLabelContainerView2: UIView! {
        didSet {
            activeLabelContainerView2.addSubview(activeLabel2)
            activeLabel2.snp.makeConstraints { $0.edges.equalToSuperview() }
            activeLabel2.numberOfLines = 0
            activeLabel2.enabledTypes = [.hashtag]
            activeLabel2.text = "少しずつSwiftの言語仕様を分かってきました！\n#駆け出しエンジニアと繋がりたい"
            activeLabel2.textColor = .black
            activeLabel2.hashtagColor = .green
            activeLabel2.handleHashtagTap { self.alert("hashtag", message: $0) }
        }
    }

    @IBOutlet private var activeLabelContainerView3: UIView! {
        didSet {
            activeLabelContainerView3.addSubview(activeLabel3)
            activeLabel3.snp.makeConstraints { $0.edges.equalToSuperview() }
            activeLabel3.numberOfLines = 0
            activeLabel3.enabledTypes = [.url]
            activeLabel3.text = "質問があれば https://twitter.com までお願いします"
            activeLabel3.textColor = .black
            activeLabel3.URLColor = .blue
            activeLabel3.handleURLTap { self.alert("url", message: $0.absoluteString) }
        }
    }

    @IBOutlet private var activeLabelContainerView4: UIView! {
        didSet {
            activeLabelContainerView4.addSubview(activeLabel4)
            activeLabel4.snp.makeConstraints { $0.edges.equalToSuperview() }
            activeLabel4.numberOfLines = 0
            let actieType = ActiveType.custom(pattern: "\\s山.\\b")
            activeLabel4.enabledTypes = [actieType]
            activeLabel4.text = "今日は雨だね 山田 はじめです 山川 です"
            activeLabel4.textColor = .black
            activeLabel4.customColor = [actieType: .cyan]
            activeLabel4.handleCustomTap(for: actieType) { self.alert("custom", message: $0) }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ActiveLabel"
    }

    func alert(_ title: String, message: String) {
        let vc = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        vc.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(vc, animated: true, completion: nil)
    }
}
