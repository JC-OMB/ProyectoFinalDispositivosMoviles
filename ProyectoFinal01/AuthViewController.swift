//
//  AuthViewController.swift
//  ProyectoFinal01
//
//  Created by Jose Gerardo Moran Hernandez on 08/11/21.
//

import UIKit
import FirebaseAuth

class AuthViewController: UIViewController {
    
    @IBOutlet weak var correo: UITextField!
    @IBOutlet weak var contra: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registrarse(_ sender: Any) {
        if let email = correo.text, let password = contra.text{
            Auth.auth().createUser(withEmail: email, password: password){
                (result, error) in
                if let result = result, error == nil{
                    // funciona el registro
                    // alert que menciona que fue exitoso el registro
                    let successController = UIAlertController(title: "Exito", message: "Exito al registrar", preferredStyle: .alert)
                    successController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    self.present(successController, animated: true, completion: nil)
                }else{
                    // no funciono el registro
                    // alert que menciona que no fue exitoso el registro
                    let alertController = UIAlertController(title: "Error", message: "Error al generar registro", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    
    @IBAction func logIn(_ sender: Any) {

        if let email = correo.text, let password = contra.text{
            Auth.auth().signIn(withEmail: email, password: password){
                (result, error) in
                if let result = result, error == nil{
                    // funciona log in

                    // alert que menciona que fue exitoso el log in
/*
                    let successController = UIAlertController(title: "Exito", message: "Login Exitoso", preferredStyle: .alert)
                    successController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    self.present(successController, animated: true, completion: nil)
 */
                    //
                    self.performSegue(withIdentifier: "signIn", sender: nil) //<- revisar
                }else{
                    // no funciono el log in
                    // alert que menciona que no fue exitoso el log in
                    let alertController = UIAlertController(title: "Error", message: "Error al hacer el Login", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
