//
//  ViewController.swift
//  Bushe
//
//  Created by Влад Бокин on 27.05.2021.
//

//["Главная", "Доставка", "Мои покупки", "Новости", "Заведения", "Сотруднки", "Продукция", "Акции", "Доброе дело", "Стать частью 'Буше'", "Анкеты"]
import UIKit
import SideMenu

class ViewController: UIViewController, MenuControllerDelegate {
    
    private var sideMenu: SideMenuNavigationController?
    private let secondController = SecondViewController()
    private let thirdController = ThirdViewController()
    
     
    override func viewDidLoad() {
        super.viewDidLoad()
        let menu = menuController(with: SideMemuItem.allCases )
        
        menu.delegate = self
        
        sideMenu = SideMenuNavigationController(rootViewController: menu)
        sideMenu?.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
    }
    
    private func addChildControllers(){
        addChild(secondController)
        addChild(thirdController)
         
        view.addSubview(secondController.view)
        view.addSubview(thirdController.view)
        
        secondController.view.frame = view.bounds
        thirdController.view.frame = view.bounds
        
        secondController.didMove(toParent: self)
        thirdController.didMove(toParent: self)
        
        secondController.view.isHidden = true
        thirdController.view.isHidden = true

    }
    @IBAction func didTapButton(_ sender: UIBarButtonItem) {
        present(sideMenu!, animated: true )
    }

    func go(){
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyboard.instantiateViewController(withIdentifier: "second")
        self.present(newViewController, animated: true, completion: nil)
    }
    func didSelectMenuItem(named: SideMemuItem) {
        sideMenu?.dismiss(animated: true, completion: { [weak self] in
            
            self?.title = named.rawValue
            
            switch named{
            case .home:
                self?.secondController.view.isHidden = true
                self?.thirdController.view.isHidden = true
                
            
            case .second:
                self?.secondController.view.isHidden = false
                self?.thirdController.view.isHidden = true
               
            
                let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
                label.center = CGPoint(x: 160, y: 285)
                label.textAlignment = .center
                label.text = "I'am a test label"
                self!.view.addSubview(label)
            case .third:
                self?.secondController.view.isHidden = true
                self?.thirdController.view.isHidden = false
                
            case .one:
                self?.secondController.view.isHidden = true
                self?.thirdController.view.isHidden = false
               
            case .two:
                self?.secondController.view.isHidden = true
                self?.thirdController.view.isHidden = false
                
            case .news:
                self?.secondController.view.isHidden = true
                self?.thirdController.view.isHidden = false
                
            case .cafe:
                self?.secondController.view.isHidden = true
                self?.thirdController.view.isHidden = false
                
            case .eployees:
                self?.secondController.view.isHidden = true
                self?.thirdController.view.isHidden = false
                
            case .products:
                self?.secondController.view.isHidden = true
                self?.thirdController.view.isHidden = false
                
            case .ankets:
                self?.secondController.view.isHidden = true
                self?.thirdController.view.isHidden = false
            }
            
    })
    
}
}
