//
//  ViewController.swift
//  menu
//
//  Created by Luccas Santana Marinho on 08/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    var sidebarView: UIView!
    var tableView: UITableView!
    var imageV: UIImageView!
    var lbl: UILabel!
    var isEnabled: Bool = false
    
    var arrData = ["Way", "Esfera", "Toro Invstimentos", "Sim", "emDia"]
    var arrImages:[UIImage] = [#imageLiteral(resourceName: "way.png"),#imageLiteral(resourceName: "esfera.png"),#imageLiteral(resourceName: "toro investimentos.png"),#imageLiteral(resourceName: "sim.png"),#imageLiteral(resourceName: "emDia.png")]

    let menuBtn = UIButton(type: .custom)
    let imageDisable = UIImage(named: "hamburger")
    let imageActive = UIImage(named: "cancel")
    
    let conhecaTambem = UILabel(frame: .zero)
    
    let imageSx = UIImage(named: "sx banner")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        //--------------//
        
        conhecaTambem.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(conhecaTambem)
        conhecaTambem.text = "Conheça também"
        conhecaTambem.font = UIFont.boldSystemFont(ofSize: 18)
        conhecaTambem.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
        conhecaTambem.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        //--------------//
        
        let imageView = UIImageView(image: imageSx!)
        imageView.frame = CGRect(x: 10, y: 500, width: 300, height: 80)
        view.addSubview(imageView)
        
        //--------------//
        
        self.menuBtn.setImage(imageDisable, for: .normal)
        
        menuBtn.widthAnchor.constraint(equalToConstant: 20).isActive = true
        menuBtn.heightAnchor.constraint(equalToConstant: 20).isActive = true
        menuBtn.addTarget(self, action: #selector(menuBtnClick), for: .touchUpInside)
        
        let menuBarItem = UIBarButtonItem(customView: menuBtn)
        self.navigationItem.leftBarButtonItem = menuBarItem
        
        menuBtn.tintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        
        sidebarView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: self.view.bounds.height))
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 0, height: self.view.bounds.height))
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.view.addSubview(sidebarView)
        self.sidebarView.addSubview(tableView)
        self.tableView.addSubview(conhecaTambem)
        self.tableView.addSubview(imageView)
        
    }

    @objc func menuBtnClick(sender: UIButton!) {
        
        if isEnabled{
            
            UIView.animate(withDuration: 0.3) {
                
                self.sidebarView.frame = CGRect(x: 0, y: 0, width: 0, height: self.view.bounds.height)
                
                self.tableView.frame = CGRect(x: 0, y: 0, width: 0, height: self.view.bounds.height)
                
                self.menuBtn.setImage(self.imageDisable, for: .normal)
                
            }
            
            isEnabled = false
            
        } else {
            
            UIView.animate(withDuration: 0.3) { [self] in
                
                self.sidebarView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)

                self.tableView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)

                self.menuBtn.setImage(self.imageActive, for: .normal)
            }
            
            isEnabled = true
            
        }
        
    }

}

extension ViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arrData.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        imageV = UIImageView(frame: CGRect(x: 22, y: 27, width: 24, height: 22))
        imageV.contentMode = .scaleToFill
        imageV.image = self.arrImages[indexPath.row]
        
        cell.addSubview(imageV)
        
        lbl = UILabel(frame: CGRect(x: 65, y: 10, width: cell.bounds.width-(self.imageV.bounds.width+24), height: cell.bounds.height-16))
        lbl.text = self.arrData[indexPath.row]
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        
        cell.addSubview(lbl)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 70
        
    }
    
}
