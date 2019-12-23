//
//  ViewController.swift
//  conversores
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 25/06/19.
//  Copyright © 2019 Gabriel Chirico Mahtuk de Melo Sanzone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //texto do que esta sendo convertido
    @IBOutlet weak var lbUnit: UILabel!
    //caixa de inserir texto!
    @IBOutlet weak var tfValor: UITextField!
    //bitão1
    @IBOutlet weak var btUnit1: UIButton!
    //botao2
    @IBOutlet weak var btUnit2: UIButton!
    //resultado
    @IBOutlet weak var lbResultado: UILabel!
    //Variavel do resultado
    var resultado: String! {
        didSet {
            lbResultado.text = resultado.maxLength(length: 7)
        }
    }
    //@IBOutlet weak var lbResultadoUnit: UILabel!
    @IBOutlet weak var lbResultadoUnit: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func showNext(_ sender: UIButton) {
        switch lbUnit.text! {
        case "Temperatura":
            lbUnit.text = "Peso"
            btUnit1.setTitle("Kilograma", for: .normal)
            btUnit2.setTitle("Libra", for: .normal)
        case "Peso":
            lbUnit.text = "Moeda"
            btUnit1.setTitle("Real", for: .normal)
            btUnit2.setTitle("Dolar", for: .normal)
        case "Moeda":
            lbUnit.text = "Distancia"
            btUnit1.setTitle("Metro", for: .normal)
            btUnit2.setTitle("Kilometro", for: .normal)
        default:
            lbUnit.text = "Temperatura"
            btUnit1.setTitle("Celcius", for: .normal)
            btUnit2.setTitle("Farenheint", for: .normal)
        
        }
        converter(nil)
    }
    
    @IBAction func converter(_ sender: UIButton?) {
        if let sender = sender {
            if sender == btUnit1 {
                btUnit2.alpha = 0.5
            } else {
                btUnit1.alpha = 0.5
            }
            sender.alpha = 1.0
        }
       
        switch lbUnit.text!{
        case "Temperatura":
            calcTemperatura()
        case "Peso":
            //teste()
            calcPeso()
        case "Moeda":
            //teste()
            calcMoeda()
        default:
            //teste()
            calcDistancia()
            
        }
    }

    func calcTemperatura(){
        guard let temperatura = Double(tfValor.text!) else {return}
        if btUnit1.alpha == 1.0 {
            lbResultadoUnit.text = "Farenheit"
            resultado = String(temperatura * 1.8 + 32.0)
        } else {
            lbResultadoUnit.text = "Celcius"
            resultado = String((temperatura - 32 ) / 1.8)
        }
    }
    
    func calcPeso(){
        guard let peso = Double(tfValor.text!) else {return}
        if btUnit1.alpha == 1.0 {
            lbResultadoUnit.text = "Libra"
            resultado = String(peso / 2.2046)
        } else {
            lbResultadoUnit.text = "Kilograma"
            resultado = String(peso * 2.2046)
        }
        
    }
    
    func calcMoeda(){
        guard let moeda = Double(tfValor.text!) else {return}
        if btUnit1.alpha == 1.0 {
            lbResultadoUnit.text = "Dolar"
            resultado = String(moeda * 3.5)
        } else {
            lbResultadoUnit.text = "Real"
            resultado = String(moeda / 3.5)
        }
    }
    
    func calcDistancia(){
        guard let distancia = Double(tfValor.text!) else {return}
        if btUnit1.alpha == 1.0 {
            lbResultadoUnit.text = "Kilometro"
            resultado = String(distancia / 1000.0)
        } else {
            lbResultadoUnit.text = "Metros"
            resultado = String(distancia * 1000.0)
        }
    }
}

extension String {
   func maxLength(length: Int) -> String {
       var str = self
       let nsString = str as NSString
       if nsString.length >= length {
           str = nsString.substring(with:
               NSRange(
                location: 0,
                length: nsString.length > length ? length : nsString.length)
           )
       }
       return  str
   }
}
