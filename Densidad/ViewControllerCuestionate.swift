//
//  ViewControllerCuestionate.swift
//  Densidad
//
//  Created by Rodrigo Esparza on 4/6/19.
//  Copyright © 2019 Rodrigo Esparza. All rights reserved.
//

import UIKit

class ViewControllerCuestionate: UIViewController {

    @IBOutlet weak var lbPregunta: UILabel!
    @IBOutlet weak var resp1: UIButton!
    @IBOutlet weak var resp2: UIButton!
    @IBOutlet weak var resp3: UIButton!
    @IBOutlet weak var resp4: UIButton!
    @IBOutlet weak var Terminar: UIButton!
    
    var arrPreguntas: NSArray!
    var pregunta = [String]()
    var respuesta = [String](repeating: " ", count: 11)
    var ordenRespuestas = Array(repeating: Array(repeating: 0, count: 5 ), count: 11)
    var contador : Int = 1
    var respuestaRandom = ["","","",""]
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Terminar.isHidden = true
        cargaPregunta()
    }
    
    
    func cargaPregunta(){
        pregunta = arrPreguntas[contador] as! [String]
        
        if (ordenRespuestas[contador][0] == 0) {
            var ran1: Int = 0
            var ran2: Int = 0
            var ran3: Int = 0
            var ran4: Int = 0
            
            ran1 = Int.random(in: 1...4)
            while ran2 == 0{
                ran2 = Int.random(in: 1...4)
                if(ran2 == ran1){
                    ran2 = 0
                }
            }
            while ran3 == 0{
                ran3 = Int.random(in: 1...4)
                if(ran3 == ran1 || ran3 == ran2){
                    ran3 = 0
                }
            }
            if ran1 != 1 && ran2 != 1 && ran3 != 1{
                ran4 = 1
            }
            else if ran1 != 2 && ran2 != 2 && ran3 != 2{
                ran4 = 2
            }
            else if ran1 != 3 && ran2 != 3 && ran3 != 3{
                ran4 = 3
            }
            else{
                ran4 = 4
            }
            ordenRespuestas[contador][0] = 1
            ordenRespuestas[contador][1] = ran1
            ordenRespuestas[contador][2] = ran2
            ordenRespuestas[contador][3] = ran3
            ordenRespuestas[contador][4] = ran4
            
        }
        
        
        let arr = ordenRespuestas[contador]
        
        lbPregunta.text? = pregunta[0]
        resp1.setTitle(pregunta[arr[1]], for: .normal)
        resp2.setTitle(pregunta[arr[2]], for: .normal)
        resp3.setTitle(pregunta[arr[3]], for: .normal)
        resp4.setTitle(pregunta[arr[4]], for: .normal)
    }
    
    @IBAction func regresarPregunta(_ sender: Any) {
        
        if(contador > 1){
            contador = contador-1
        }
        Terminar.isHidden = true
        cargaPregunta()
    }
    
    @IBAction func respuesta1(_ sender: Any) {
        
        if(contador == arrPreguntas.count - 1){
            respuesta[contador] = pregunta[1]
            Terminar.isHidden = false
        }else{
            respuesta[contador] = pregunta[1]
            contador = contador+1
            cargaPregunta()
        }
    }
    
    @IBAction func respuesta2(_ sender: Any) {
        if(contador == arrPreguntas.count - 1){
            respuesta[contador] = pregunta[2]
            Terminar.isHidden = false
        }else{
            respuesta[contador] = pregunta[2]
            contador = contador+1
            cargaPregunta()
        }
    }
    
    @IBAction func respuesta3(_ sender: Any) {
        if(contador == arrPreguntas.count - 1){
            respuesta[contador] = pregunta[3]
            Terminar.isHidden = false
        }else{
            respuesta[contador] = pregunta[3]
            contador = contador+1
            cargaPregunta()
        }
    }
    
    @IBAction func respuesta4(_ sender: Any) {
        if(contador == arrPreguntas.count - 1){
            respuesta[contador] = pregunta[4]
            Terminar.isHidden = false
        }else{
            respuesta[contador] = pregunta[4]
            contador = contador+1
            cargaPregunta()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let vista = segue.destination as! ViewControllerResultados

        
        vista.arrPreguntas = (arrPreguntas as! NSMutableArray)
        vista.respuestas = respuesta
        
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
