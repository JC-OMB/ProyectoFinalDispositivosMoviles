//
//  ViewController.swift
//  ProyectoFinal01
//
//  Created by Juan Carlos OMB on 30/09/21.
//

import UIKit

class ViewController: UIViewController {
    
    var users = [contactos]()
    
    @IBOutlet weak var Nombre: UITextField!
    @IBOutlet weak var Correo: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var Telefono: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let user = users[indexPath.row]
        
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = String(user.phone)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        AlertService.updateUser(in: self){
            
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowat indexPath: IndexPath){
        guard editingStyle == .delete else {return}
    }


}

