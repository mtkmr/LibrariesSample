//
//  LottieViewController.swift
//  LibrariesSample
//
//  Created by Masato Takamura on 2021/06/03.
//

import UIKit
import Lottie
import SnapKit

final class LottieViewController: UIViewController {
    
    private var isPlaying = false
    
    private let animationView1 = AnimationView()
    @IBOutlet private weak var animationContainerView1: UIView! {
        didSet {
            guard let animation = Animation.named("31078-pin-animation") else {
                print("\(#line) file not found")
                return
            }
            animationContainerView1.addSubview(animationView1)
            animationView1.snp.makeConstraints { (maker) in
                maker.edges.equalToSuperview()
            }
            animationView1.contentMode = .scaleAspectFit
            animationView1.animation = animation
            
        }
    }
    
    private let animationView2 = AnimationView()
    @IBOutlet private weak var animationContainerView2: UIView! {
        didSet {
            guard let animation = Animation.named("6843-map-location") else {
                print("\(#line) file not found")
                return
            }
            animationContainerView2.addSubview(animationView2)
            animationView2.snp.makeConstraints { (maker) in
                maker.edges.equalToSuperview()
            }
            animationView2.contentMode = .scaleAspectFit
            animationView2.animation = animation
        }
    }
    
    private let animationView3 = AnimationView()
    @IBOutlet private weak var animationContainerView3: UIView! {
        didSet {
            guard let animation = Animation.named("57222-food-loading") else {
                print("\(#line) file not found")
                return
            }
            animationContainerView3.addSubview(animationView3)
            animationView3.snp.makeConstraints { (maker) in
                maker.edges.equalToSuperview()
            }
            animationView3.contentMode = .scaleAspectFit
            animationView3.animation = animation
        }
    }
    
    private let animationView4 = AnimationView()
    @IBOutlet private weak var animationContainerView4: UIView! {
        didSet {
            guard let animation = Animation.named("24064-food-squeeze-with-burger-and-hot-dog") else {
                print("\(#line) file not found")
                return
            }
            animationContainerView4.addSubview(animationView4)
            animationView4.snp.makeConstraints { (maker) in
                maker.edges.equalToSuperview()
            }
            animationView4.contentMode = .scaleAspectFit
            animationView4.animation = animation
        }
    }
    
    @IBOutlet private weak var animationButton: UIButton! {
        didSet {
            animationButton.addTarget(self, action: #selector(animationButtonTapped(_:)), for: .touchUpInside)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Lottie"
    }
}

private extension LottieViewController {
    @objc func animationButtonTapped(_ sender: UIButton) {
        isPlaying.toggle()
        let animationViews = [animationView1, animationView2, animationView3, animationView4]
        animationViews.forEach {
            if isPlaying {
                print("playing")
                $0.animationSpeed = 0.5
                $0.play(fromProgress: 0, toProgress: 1, loopMode: .loop)
            } else {
                print("stop")
                $0.stop()
            }
        }
    }
}
