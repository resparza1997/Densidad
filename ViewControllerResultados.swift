//
//  ViewControllerResultados.swift
//  Densidad
//
//  Created by Rodrigo Esparza on 4/6/19.
//  Copyright © 2019 Rodrigo Esparza. All rights reserved.
//

import UIKit

class ViewControllerResultados: UIViewController, UITableViewDelegate , UITableViewDataSource {
    

    var arrPreguntas : NSMutableArray!
    var respuestas = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(respuestas[0])
        print(respuestas)

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return respuestas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let respUsua = respuestas[indexPath.row] as String
        //let arrBien = arrPreguntas[indexPath.row + 1]
        //let respBien = arrBien[1] as String
        
        //if( respUsua == respBien ){
            cell.textLabel?.text = respUsua
        //}
        //else{
            //cell.textLabel?.text = "Mal"
        //}
        
        
        
        return cell
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
