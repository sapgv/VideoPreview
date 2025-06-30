//
//  ViewController.swift
//  VideoPreview
//
//  Created by Grigory Sapogov on 30.06.2025.
//

import UIKit

class ViewController: UIViewController {

    private let videoPreview = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Call"
        self.setupVideoPreview()
        self.setupView()
        self.setupConstraints()
        self.setupPanGesture()
    }

}

private extension ViewController {
    func setupVideoPreview() {
        self.videoPreview.backgroundColor = .systemGreen
        self.videoPreview.layer.cornerRadius = 8
        self.videoPreview.clipsToBounds = true
    }
    
    func setupView() {
        self.view.addSubview(videoPreview)
    }
    
    func setupConstraints() {
        videoPreview.translatesAutoresizingMaskIntoConstraints = false
        videoPreview.widthAnchor.constraint(equalToConstant: 100).isActive = true
        videoPreview.heightAnchor.constraint(equalToConstant: 200).isActive = true
        videoPreview.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        videoPreview.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
//        videoPreview.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        videoPreview.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    func setupPanGesture() {
        let panGesture = UIPanGestureRecognizer()
        panGesture.addTarget(self, action: #selector(panGestureCall))
        videoPreview.addGestureRecognizer(panGesture)
    }
    
    @objc
    func panGestureCall(_ sender: UIPanGestureRecognizer) {
        let point = sender.translation(in: view)
        videoPreview.center = CGPoint(x: videoPreview.center.x + point.x, y: videoPreview.center.y + point.y)
        sender.setTranslation(CGPoint.zero, in: view)
    }
}
