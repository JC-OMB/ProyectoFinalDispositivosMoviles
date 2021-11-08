//
//  logOutViewController.swift
//  ProyectoFinal01
//
//  Created by Jose Gerardo Moran Hernandez on 07/11/21.
//

import UIKit
import FirebaseAuth

class logOutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func signOut(_ sender: Any) {
        do{
            try Auth.auth().signOut()
            performSegue(withIdentifier: "signOut", sender: nil)
            
        }catch{
            print(error)
            
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
