//
//  SideMenu.swift
//  Bushe
//
//  Created by Влад Бокин on 27.05.2021.
//

import Foundation
import UIKit 

protocol MenuControllerDelegate{
    func didSelectMenuItem(named: SideMemuItem)
}

//["Главная", "Доставка", "Мои покупки", "Новости", "Заведения", "Сотруднки", "Продукция", "Акции", "Доброе дело", "Стать частью 'Буше'", "Анкеты"]
enum SideMemuItem: String, CaseIterable {
    case home = "Главная"
    case second = "Стать частью 'Буше'"
    case third = "Акции"
    case one = "Доставка"
    case two = "Мои покупки"
    case news = "Новости"
    case cafe = "Заведения"
    case eployees = "Сотруднки"
    case products = "Продукция"
    case ankets = "Анкеты"
}

class menuController: UITableViewController{
    
    public var delegate: MenuControllerDelegate?
    
    private let menuItems: [SideMemuItem]
    
    init(with menuItems: [SideMemuItem]){
        self.menuItems = menuItems
        super.init(nibName: nil, bundle: nil)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //table
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = menuItems[indexPath.row].rawValue
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true )
        let selectedItem = menuItems[indexPath.row]
        delegate?.didSelectMenuItem(named: selectedItem )
    }
}
