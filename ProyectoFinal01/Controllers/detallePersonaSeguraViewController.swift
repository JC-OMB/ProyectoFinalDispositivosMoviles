//
//  deatllePersonaSeguraViewController.swift
//  ProyectoFinal01
//
//  Created by Jose Gerardo Moran Hernandez on 04/10/21.
//

import UIKit

class detallePersonaSeguraViewController: UIViewController {
    var personaSeg: personaSegura?
    
    @IBOutlet weak var personaEtiqueta: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        personaEtiqueta.text = personaSeg?.nombre
        //descripcionVistaTexto.text = raza?.descripcion
        // Do any additional setup after loading the view.
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
