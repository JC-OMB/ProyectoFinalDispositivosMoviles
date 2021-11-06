//
//  ViewController.swift
//  ProyectoFinal01
//
//  Created by Juan Carlos OMB on 30/09/21.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    @IBOutlet weak var Nombre: UITextField!
    @IBOutlet weak var Correo: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var Telefono: UITextField!
    //manco :v
   /*
    func validateFields() -> String?{
        if Nombre.text?.components(in: .whitespacesAndNewLines)=="" || Correo.text?.components(in: .whitespacesAndNewLines)=="" || Password.text?.components(in: .whitespacesAndNewLines)=="" || Telefono.text?.components(in: .whitespacesAndNewLines)=="" {
            
        }
    }
    */
    @IBAction func CrearCuenta(_ sender: Any) {
        if let email = Correo.text, let password = Password.text{
            Auth.auth().createUser(withEmail: email, password: password){
                (result, error) in
                if let result = result, error == nil{
                    //exito
                    
                }else{
                    //error
                    let alertController = UIAlertController(title: "Error", message: "Error al crear al usuario", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

