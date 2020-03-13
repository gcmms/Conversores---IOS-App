//
//  ViewController.swift
//  conversores
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 25/06/19.
//  Copyright © 2019 Gabriel Chirico Mahtuk de Melo Sanzone. All rights reserved.
//

import UIKit

enum Grandeza: String {
    case temperatura = "Temperatura"
    case peso = "Peso"
    case moeda = "Moeda"
    case distancia = "Distancia"
}


class ViewController: UIViewController {
    //texto do que esta sendo convertido
    @IBOutlet weak var lbUnit: UILabel!
    var grandezaPath: Grandeza = .temperatura
    //caixa de inserir texto!
    @IBOutlet weak var tfValor: UITextField!
    //bitão1
    @IBOutlet weak var btUnit1: UIButton!
    //botao2
    @IBOutlet weak var btUnit2: UIButton!
    //resultado
    @IBOutlet weak var lbResultado: UILabel!
    var resultado: Double = 0.0 {
        didSet {
            lbResultado.text = String(resultado).maxLength(length: 7)
        }
    }
    @IBOutlet weak var lbGrandezaAtual: UILabel!
    var grandezaAtual: String = "" {
        didSet {
            lbGrandezaAtual.text = grandezaAtual
        }
    }
    
    //@IBOutlet weak var lbResultadoUnit: UILabel!
    @IBOutlet weak var lbResultadoUnit: UILabel!
    var grandezaConvertida: String = "" {
        didSet {
            lbResultadoUnit.text = grandezaConvertida
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ResetApp
        grandezaAtual = "Celcius"
        resultado = 0.0
        grandezaConvertida = "Selecione"
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
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
            calcPeso()
        case "Moeda":
            calcMoeda()
        default:
            calcDistancia()
        }
    }

    func dismissKeyboard(){
        view.endEditing(true)
    }
}

//Metodos de Calcular
extension ViewController {
    func calcTemperatura(){
        guard let temperatura = Double(tfValor.text!) else {return}
        if btUnit1.alpha == 1.0 {
            grandezaConvertida = "Farenheit"
            grandezaAtual = "Celcius"
            resultado = (temperatura * 1.8) + 32.0
        } else {
            grandezaConvertida = "Celcius"
            grandezaAtual = "Farenheit"
            resultado = (temperatura - 32 ) / 1.8
        }
    }
    
    func calcPeso(){
        guard let peso = Double(tfValor.text!) else {return}
        if btUnit1.alpha == 1.0 {
            grandezaConvertida = "Libra"
            grandezaAtual = "Kilograma"
            resultado = peso / 2.2046
        } else {
            grandezaConvertida = "Kilograma"
            grandezaAtual = "Libra"
            resultado = peso * 2.2046
        }
    }
    
    func calcMoeda(){
        guard let moeda = Double(tfValor.text!) else {return}
        if btUnit1.alpha == 1.0 {
            grandezaConvertida = "Dolar"
            grandezaAtual = "Real"
            resultado = moeda * 3.5
        } else {
            grandezaConvertida = "Real"
            grandezaAtual = "Dolar"
            resultado = moeda / 3.5
        }
    }
    
    func calcDistancia(){
        guard let distancia = Double(tfValor.text!) else {return}
        if btUnit1.alpha == 1.0 {
            grandezaConvertida = "Kilometro"
            grandezaAtual = "Metros"
            resultado = distancia / 1000.0
        } else {
            grandezaConvertida = "Metros"
            grandezaAtual = "Kilometro"
            resultado = distancia * 1000.0
        }
    }
}
