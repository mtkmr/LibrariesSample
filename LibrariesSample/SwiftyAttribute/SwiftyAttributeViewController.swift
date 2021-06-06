//
//  SwiftyAttributeViewController.swift
//  LibrariesSample
//
//  Created by Masato Takamura on 2021/06/03.
//

import SwiftyAttributes
import UIKit

final class SwiftyAttributeViewController: UIViewController {
    // SwiftyAttributeを使用しない場合
    @IBOutlet private var noSwiftyAttributeLabel: UILabel! {
        didSet {
            let style = NSMutableParagraphStyle()
            style.lineSpacing = 10
            style.alignment = .center
            let textAttribute1: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 20.0),
                .paragraphStyle: style,
                .foregroundColor: UIColor.green,
                .strokeColor: UIColor.red,
                .strokeWidth: -3.0
            ]
            let textAttribute2: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 20.0),
                .paragraphStyle: style,
                .foregroundColor: UIColor.purple,
                .strokeColor: UIColor.green,
                .strokeWidth: -2.0
            ]

            let attText1 = NSMutableAttributedString(string: "これは装飾", attributes: textAttribute1)
            let attText2 = NSMutableAttributedString(string: "テキストです", attributes: textAttribute2)
            attText1.append(attText2)

            noSwiftyAttributeLabel.attributedText = attText1
        }
    }

    // SwiftyAttributeを使用した場合
    @IBOutlet private var swiftyAttributeLabel: UILabel! {
        didSet {
            let style = NSMutableParagraphStyle()
            style.lineSpacing = 10
            style.alignment = .center
            swiftyAttributeLabel.attributedText =
                "これは装飾"
                .withFont(.systemFont(ofSize: 20.0))
                .withParagraphStyle(style)
                .withTextColor(.green)
                .withStrokeColor(.red)
                .withStrokeWidth(-3.0)
                +
                "テキストです"
                .withFont(.systemFont(ofSize: 20.0))
                .withParagraphStyle(style)
                .withTextColor(.purple)
                .withStrokeColor(.green)
                .withStrokeWidth(-2.0)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SwiftyAttribute"
    }
}
