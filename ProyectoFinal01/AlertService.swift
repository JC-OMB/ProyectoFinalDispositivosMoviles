//
//  AlertService.swift
//  ProyectoFinal01
//
//  Created by user189479 on 11/7/21.
//

import UIKit

class AlertService{
    
    private init(){}
    
    static func addUser(in vc: UIViewController, completion: @escaping (contactos) -> Void){
        let alert = UIAlertController(title: "Add Contact", message: nil, preferredStyle: .alert)
        alert.addTextField{ (nameTF) in
            nameTF.placeholder = "Name"
        }
        alert.addTextField{ (phoneTF) in
            phoneTF.placeholder = "Phone"
            phoneTF.keyboardType = .numberPad
        }
        let add = UIAlertAction(title: "Add", style: .default){ _ in
            guard
                let name = alert.textFields?.first?.text,
                let phoneString = alert.textFields?.last?.text,
                let phone = Int(phoneString)
            else {return}
            
            let user = user
        }
    }

}
