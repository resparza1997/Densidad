//
//  ViewControllerExperimenta.swift
//  Densidad
//
//  Created by Rodrigo Esparza on 3/23/19.
//  Copyright © 2019 Rodrigo Esparza. All rights reserved.
//

import UIKit

class ViewControllerExperimenta: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    //Picker View
    @IBOutlet weak var pvLiquidos: UIPickerView!
    var liquidos = ["Agua", "Agua de mar", "Aceite", "Gasolina", "Alcohol"]
    var densidadesLiquidos = ["1000", "1027", "920", "680", "720"]
    var densidadLiquido : Double!
    
    
    @IBOutlet weak var vistaOpacidad: UIView!
    @IBOutlet weak var gifLiquido: UIImageView!
    @IBOutlet weak var gramos1: UITextField!
    @IBOutlet weak var gramos2: UITextField!
    @IBOutlet weak var volumen1: UITextField!
    @IBOutlet weak var volumen2: UITextField!
    @IBOutlet weak var densidad1: UITextField!
    @IBOutlet weak var densidad2: UITextField!
    
    @IBOutlet weak var objeto1: UIImageView!
    @IBOutlet weak var objeto2: UIImageView!
    
    
    private lazy var waveView: LCWaveView = {
        let waveView = LCWaveView(frame: CGRect(x: 0, y: 0, width: vistaOpacidad.bounds.size.width , height: 0 ), color: UIColor.black)
        waveView.waveRate = 2
        waveView.waveSpeed = 1
        waveView.waveHeight = 7
        return waveView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gramos1.text = "0"
        gramos2.text = "0"
        volumen1.text = "0"
        volumen2.text = "0"
        densidad1.text = "0"
        densidad2.text = "0"
        densidadLiquido = 1000
        
        
        
        //Waves
        gifLiquido.loadGif(name: "agua fondo")
        waveView.startWave()
        vistaOpacidad.addSubview(waveView)

        vistaOpacidad.backgroundColor = UIColor.blue.withAlphaComponent(0.5)

        
        // Listen for keyboardevents
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        
        //Tap Gesture Recognizer
        let tap = UITapGestureRecognizer(target: self, action: #selector(calculaDensidad))
        view.addGestureRecognizer(tap)
        

    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // et the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func submerging(objeto : UIView){
        
            UIView.animate(withDuration: 1, animations: {
                objeto.frame.origin.x += 15
            }){_ in
                UIView.animateKeyframes(withDuration: 1.4, delay: 0.5, options: [.autoreverse, .repeat], animations: {
                    objeto.frame.origin.x -= 15
                })
            }
   
    }
    

    
    //Función que calcula la densidad
    @IBAction func calculaDensidad() {
       
        view.endEditing(true)
        if ( gramos1.text != "0" && volumen1.text != "0" && gramos1.text != "" && volumen1.text != ""){
            let peso = Double(gramos1.text!)
            let volumen = Double(volumen1.text!)
            
            let densidad :Double = peso! / volumen!
            
            densidad1.text = String(densidad)
            
            //self.submerging(objeto: self.objeto1)
            if ( densidad > (densidadLiquido/1000)  ){
                UIView.animate(withDuration: 5){
                    self.objeto1.frame.origin.y = 440
                    
                }
                
            }
            
            if ( densidad < (densidadLiquido/1000)  ){
                UIView.animate(withDuration: 5){
                    self.objeto1.frame.origin.y = 200
                }
            }
            
            if ( densidad == (densidadLiquido/1000)  ){
                UIView.animate(withDuration: 5){
                    self.objeto1.frame.origin.y = 350
                }
                
            }
            
           
            
        }
        
        if ( gramos2.text != "0" && volumen2.text != "0" && gramos2.text != "" && volumen2.text != ""){
            let peso = Double(gramos2.text!)
            let volumen = Double(volumen2.text!)
            
            let densidad :Double = peso! / volumen!
            
            densidad2.text = String(densidad)
            //self.submerging(objeto: self.objeto2)
            
            if ( densidad > (densidadLiquido/1000)  ){
                UIView.animate(withDuration: 5){
                    self.objeto2.frame.origin.y = 440
                }
            }
            
            if ( densidad < (densidadLiquido/1000)  ){
                UIView.animate(withDuration: 5){
                    self.objeto2.frame.origin.y = 200
                }
            }
            if ( densidad == (densidadLiquido/1000)  ){
                UIView.animate(withDuration: 5){
                    self.objeto2.frame.origin.y = 350
                }
            }
        }
        
        
    }
    

    // MARK: - Picker View
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return liquidos.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
            return liquidos[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        densidadLiquido = Double(densidadesLiquidos[row])
        
        //Agua
        if(row == 0){
            vistaOpacidad.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
            densidadLiquido = Double(densidadesLiquidos[row])
            calculaDensidad()
        }
        
        //Agua de mar
        if(row == 1){
            vistaOpacidad.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
            densidadLiquido = Double(densidadesLiquidos[row])
            calculaDensidad()
        }
        
        //Aceite
        if(row == 2){
            vistaOpacidad.backgroundColor = UIColor.yellow.withAlphaComponent(0.5)
            densidadLiquido = Double(densidadesLiquidos[row])
            calculaDensidad()
        }
        
        //Gasolina
        if(row == 3){
            vistaOpacidad.backgroundColor = UIColor(red: 0.898, green: 0.6745, blue: 0, alpha: 0.5) /* #e5ac00 */
            densidadLiquido = Double(densidadesLiquidos[row])
            calculaDensidad()
        }
        
        //Alcohol
        if(row == 4){
            vistaOpacidad.backgroundColor = UIColor(red: 0.9882, green: 0.9686, blue: 0.8784, alpha: 0.5) /* #fcf7e0 */
            densidadLiquido = Double(densidadesLiquidos[row])
            calculaDensidad()
        }
        
    }
    
    
    // MARK: Manage Keyboard
    deinit{
        NotificationCenter.default.removeObserver(self,name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self,name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self,name: UIResponder.keyboardWillChangeFrameNotification, object: nil)

        
    }
    @IBAction func hideKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    @objc func keyboardWillChange(notification: Notification){
        print("keyboard will show: \(notification.name.rawValue)")
        
        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        
        if notification.name == UIResponder.keyboardWillShowNotification || notification.name == UIResponder.keyboardWillChangeFrameNotification{
            view.frame.origin.y = -keyboardRect.height
        }
        else{
            view.frame.origin.y = 0
        }
    
    }
    
    @IBAction func regresar(_ sender: Any) {
        
    }
    
}
