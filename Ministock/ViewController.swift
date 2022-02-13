//
//  ViewController.swift
//  Ministock
//
//  Created by chang-hwan do on 10/02/2022.
//

import UIKit

class ViewController: UIViewController {

    private var titleView: UILabel = UILabel()
    private var secondView: UILabel = UILabel()
    private var faceID: UIButton = UIButton()
    private var easyLogin: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setbasedview()
        setSubview()
        setupMainLayout()
        
        self.view.backgroundColor = UIColor.white
    }
    
    @objc private func didTapButton() {
        let rootVC = SecondViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
    
    private func setbasedview() {
        titleView.backgroundColor = .systemBackground
        titleView.text = "ministock"
        titleView.font = .systemFont(ofSize: 28)
        titleView.textAlignment = .center
        
        secondView.backgroundColor = .systemBackground
        secondView.text = "환영합니다"
        secondView.font = .systemFont(ofSize: 28)
        secondView.textColor = UIColor(red: 0, green: 0.3, blue: 0.8, alpha: 1)
        secondView.textAlignment = .center
        
        faceID.setTitle("Face ID 로그인", for: .normal)
        faceID.setTitleColor(.black, for: .normal)
        faceID.backgroundColor = .systemBackground
        faceID.layer.borderWidth = 1
        faceID.layer.cornerRadius = 10
        
        easyLogin.setTitle("간편비밀번호 로그인", for: .normal)
        easyLogin.setTitleColor(.black, for: .normal)
        easyLogin.backgroundColor = .systemBackground
        easyLogin.layer.borderWidth = 1
        easyLogin.layer.cornerRadius = 10
        easyLogin.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    private func setSubview() {
        view.addSubview(titleView)
        view.addSubview(secondView)
        view.addSubview(faceID)
        view.addSubview(easyLogin)
        
        titleView.translatesAutoresizingMaskIntoConstraints = false
        secondView.translatesAutoresizingMaskIntoConstraints = false
        faceID.translatesAutoresizingMaskIntoConstraints = false
        easyLogin.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func setupMainLayout() {

        titleView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        titleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        titleView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        titleView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        titleView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        secondView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: -6).isActive = true
        secondView.leadingAnchor.constraint(equalTo: titleView.leadingAnchor).isActive = true
        secondView.trailingAnchor.constraint(equalTo: titleView.trailingAnchor).isActive = true
        secondView.heightAnchor.constraint(equalToConstant: 44).isActive = true
                
        faceID.bottomAnchor.constraint(equalTo:easyLogin.topAnchor, constant: -7).isActive = true
        faceID.leadingAnchor.constraint(equalTo: easyLogin.leadingAnchor).isActive = true
        faceID.trailingAnchor.constraint(equalTo: easyLogin.trailingAnchor).isActive = true
        faceID.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        easyLogin.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -36).isActive = true
        easyLogin.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        easyLogin.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        easyLogin.heightAnchor.constraint(equalToConstant: 60).isActive = true
    
        
    }
    
}

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Welcome"
    }
}
