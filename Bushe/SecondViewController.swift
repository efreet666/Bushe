//
//  SecondViewController.swift
//  Bushe
//
//  Created by Влад Бокин on 27.05.2021.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: 160, y: 285)
        label.textAlignment = .center
        label.text = "I'am a test label"
        self.view.addSubview(label)
        self.view.backgroundColor = .yellow
    }
    
    


}
