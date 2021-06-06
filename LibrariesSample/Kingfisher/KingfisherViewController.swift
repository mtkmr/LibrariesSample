//
//  KingfisherViewController.swift
//  LibrariesSample
//
//  Created by Masato Takamura on 2021/06/04.
//

import Kingfisher
import UIKit

final class KingfisherViewController: UIViewController {
    private let defImage = UIImage(named: "DefImage")

    private let urls = [
        URL(string: "https://images-na.ssl-images-amazon.com/images/I/515lVogJInL._AC_SX679_.jpg"),
        URL(string: "https://prtimes.jp/i/1355/1341/resize/33fb3ccb35c59d93bf78081c60ee0b6f.jpg"),
        URL(string: "https://athlete-fan.com/wp1/wp-content/uploads/2016/03/img156.jpg"),
        URL(string: "https://the-ans.jp/wp-content/uploads/2020/09/20200902_Andy_Murray_ap-650x433.jpg"),
        URL(string: "https://article-image-ix.nikkei.com/https%3A%2F%2Fimgix-proxy.n8s.jp%2FDSXMZO6923780018022021000001-PN1-2.jpg?s=e4608a88f23a0bfa5573c522f91b20d9"),
        URL(string: "https://meigenkakugen.net/wp-content/uploads/6a2d131408686b97c00fa9a0a341a987.jpg")
    ]

    private lazy var imageViews = [
        imageView1, imageView2, imageView3, imageView4, imageView5, imageView6
    ]

    @IBOutlet private var imageView1: UIImageView! {
        didSet {
            imageView1.image = defImage
        }
    }
    @IBOutlet private var imageView2: UIImageView! {
        didSet {
            imageView2.image = defImage
        }
    }
    @IBOutlet private var imageView3: UIImageView! {
        didSet {
            imageView3.image = defImage
        }
    }
    @IBOutlet private var imageView4: UIImageView! {
        didSet {
            imageView4.image = defImage
        }
    }
    @IBOutlet private var imageView5: UIImageView! {
        didSet {
            imageView5.image = defImage
        }
    }
    @IBOutlet private var imageView6: UIImageView! {
        didSet {
            imageView6.image = defImage
        }
    }

    @IBOutlet private var loadButton: UIButton! {
        didSet {
            loadButton.addTarget(self, action: #selector(loadButtonTapped(_:)), for: .touchUpInside)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Kingfisher"
    }
}

private extension KingfisherViewController {
    @objc
    func loadButtonTapped(_ sender: UIButton) {
        let s = urls.enumerated() // イメージとしては[(0)url1, (1)url1...(5)url5]な感じ
        print(s)
        let t = s.map { ($0.element, imageViews[$0.offset]) } // (url1...url6, imageView1...imageView6)
        print(t)
        t.forEach {
            guard
                let url = $0.0, let imageView = $0.1
            else {
                return
            }
            imageView.kf.indicatorType = .activity
            imageView.kf.setImage(
                with: url,
                placeholder: defImage
            )
        }
    }
}
