//
//  ViewController.swift
//  SuperSenhaVC
//
//  Created by Doni Silva on 27/05/21.
//

import UIKit

final class IntroViewController: UIViewController {
    
    var passwordGenerator: PasswordGenerator!
    
    enum Metrics {
        static let fontSize: CGFloat = 16
        static let fontSizePassword: CGFloat = 30
        static let titleFont: CGFloat = 40
        static let margin: CGFloat = 20
        static let textFieldW: CGFloat = 70
        static let buttonH: CGFloat = 44
        static let radius: CGFloat = 8
    }
    
    enum Constants {
        static let passGenerate = "Gerador de Senhas"
        static let quantityPass = "Quantidade de Senhas: "
        static let totalCharacters = "Total de Caracteres: "
        static let useLowerCase = "Usar letras minúsculas: "
        static let useNumbers = "Usar Números: "
        static let useCapitalLetters = "Usar Letras Maiúsculas: "
        static let makePass = "Gerar Senha"
        static let totalCharPh = "Máx. 16"
        static let specialChar = "Usar Caracteres Especiais: "
    }
    
    private lazy var lbTitle: UILabel = {
        let label = UILabel()
        label.text = Constants.passGenerate
        label.font = UIFont.boldSystemFont(ofSize: Metrics.titleFont)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelQtdeSenhas: UILabel = {
        let label = UILabel()
        label.text = Constants.quantityPass
        label.font = UIFont.systemFont(ofSize: Metrics.fontSize)
        label.textColor = UIColor.purple
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var tfSenhas: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.backgroundColor = UIColor.white
        textField.borderStyle = .line
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var lbTotalCharacters: UILabel = {
        let label = UILabel()
        label.text = Constants.totalCharacters
        label.font = UIFont.systemFont(ofSize: Metrics.fontSize)
        label.textColor = UIColor.purple
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var tfCharacters: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.white
        textField.borderStyle = .line
        textField.placeholder = Constants.totalCharPh
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var lbLetrasMin: UILabel = {
        let label = UILabel()
        label.text = Constants.useLowerCase
        label.font = UIFont.systemFont(ofSize: Metrics.fontSize)
        label.textColor = UIColor.purple
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lbNumeros: UILabel = {
        let label = UILabel()
        label.text = Constants.useNumbers
        label.font = UIFont.systemFont(ofSize: Metrics.fontSize)
        label.textColor = UIColor.purple
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lbLetrasMai: UILabel = {
        let label = UILabel()
        label.text = Constants.useCapitalLetters
        label.font = UIFont.systemFont(ofSize: Metrics.fontSize)
        label.textColor = UIColor.purple
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lbSpecialChar: UILabel = {
        let label = UILabel()
        label.text = Constants.specialChar
        label.font = UIFont.systemFont(ofSize: Metrics.fontSize)
        label.textColor = UIColor.purple
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var swLetrasMin: UISwitch = {
        let sw = UISwitch()
        sw.onTintColor = .purple
        sw.isOn = true
        sw.translatesAutoresizingMaskIntoConstraints = false
        return sw
    }()
    
    private lazy var swUsarNumeros: UISwitch = {
        let sw = UISwitch()
        sw.onTintColor = .purple
        sw.isOn = true
        sw.translatesAutoresizingMaskIntoConstraints = false
        return sw
    }()
    
    private lazy var swLetrasMai: UISwitch = {
        let sw = UISwitch()
        sw.onTintColor = .purple
        sw.isOn = true
        sw.translatesAutoresizingMaskIntoConstraints = false
        return sw
    }()
    
    private lazy var swSpecialChar: UISwitch = {
        let sw = UISwitch()
        sw.onTintColor = .purple
        sw.isOn = true
        sw.translatesAutoresizingMaskIntoConstraints = false
        return sw
    }()
    
    private lazy var btGerarSenha: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = .purple
        button.setTitle(Constants.makePass, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = Metrics.radius
        button.addTarget(self, action: #selector(buttonAction(_:)), for:.touchUpInside)
        return button
    }()
    
    var tvPassword: UITextView = {
        let textView = UITextView()
        textView.frame = .zero
        textView.contentInsetAdjustmentBehavior = .automatic
        textView.textAlignment = NSTextAlignment.justified
        textView.textColor = UIColor.purple
        textView.font = UIFont.systemFont(ofSize: Metrics.fontSizePassword)
        textView.backgroundColor = UIColor.white
        textView.text = ""
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubView()
        constraintLabelTitle()
        constraintLabelQtdeSenhas()
        constraintTfSenhas()
        constraintTotalCharacters()
        constraintTfCharacters()
        constraintLbLetrasMin()
        constraintSwLetrasMin()
        constraintLbNumeros()
        constraintUsarNumeros()
        constraintBtGerarSenha()
        constraintLbLetrasMaiusculas()
        constraintUsarLetrasMai()
        constraintLbCaracteresEspeciais()
        constraintCaracteresEspeciais()
        constraintTextView()
    }
    
    //MARK: - Adicionar Views
    private func addSubView(){
        view.addSubview(lbTitle)
        view.addSubview(labelQtdeSenhas)
        view.addSubview(tfSenhas)
        view.addSubview(lbTotalCharacters)
        view.addSubview(tfCharacters)
        view.addSubview(lbLetrasMin)
        view.addSubview(swLetrasMin)
        view.addSubview(lbNumeros)
        view.addSubview(swUsarNumeros)
        view.addSubview(btGerarSenha)
        view.addSubview(lbLetrasMai)
        view.addSubview(swLetrasMai)
        view.addSubview(lbSpecialChar)
        view.addSubview(swSpecialChar)
        view.addSubview(tvPassword)

    }

    //MARK: Configurar Constraints
    private func constraintLabelTitle(){
        NSLayoutConstraint.activate([
            lbTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Metrics.margin),
            lbTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metrics.margin),
            lbTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Metrics.margin)
        ])
    }
    
    private func constraintLabelQtdeSenhas(){
        NSLayoutConstraint.activate([
            labelQtdeSenhas.centerYAnchor.constraint(equalTo: tfSenhas.centerYAnchor),
            labelQtdeSenhas.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metrics.margin),
            labelQtdeSenhas.trailingAnchor.constraint(equalTo: tfSenhas.leadingAnchor, constant: -Metrics.margin)
        ])
    }
    
    private func constraintTfSenhas(){
        NSLayoutConstraint.activate([
            tfSenhas.topAnchor.constraint(equalTo: lbTitle.bottomAnchor, constant: Metrics.margin),
            tfSenhas.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Metrics.margin),
            tfSenhas.widthAnchor.constraint(equalToConstant: Metrics.textFieldW)
        ])
    }
    
    private func constraintTotalCharacters(){
        NSLayoutConstraint.activate([
            lbTotalCharacters.centerYAnchor.constraint(equalTo: tfCharacters.centerYAnchor),
            lbTotalCharacters.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metrics.margin),
            lbTotalCharacters.trailingAnchor.constraint(equalTo: tfCharacters.leadingAnchor, constant: -Metrics.margin)
        ])
    }
    
    private func constraintTfCharacters(){
        NSLayoutConstraint.activate([
            tfCharacters.topAnchor.constraint(equalTo: tfSenhas.bottomAnchor, constant: Metrics.margin),
            tfCharacters.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Metrics.margin),
            tfCharacters.widthAnchor.constraint(equalToConstant: Metrics.textFieldW)
        ])
    }
    
    private func constraintLbLetrasMin(){
        NSLayoutConstraint.activate([
            lbLetrasMin.topAnchor.constraint(equalTo: tfCharacters.bottomAnchor, constant: Metrics.margin),
            lbLetrasMin.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metrics.margin),
            lbLetrasMin.trailingAnchor.constraint(equalTo: swLetrasMin.leadingAnchor, constant: -Metrics.margin)
        ])
    }
    
    private func constraintSwLetrasMin(){
        NSLayoutConstraint.activate([
            swLetrasMin.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Metrics.margin),
            swLetrasMin.centerYAnchor.constraint(equalTo: lbLetrasMin.centerYAnchor)
        ])
    }
    
    private func constraintLbNumeros(){
        NSLayoutConstraint.activate([
            lbNumeros.topAnchor.constraint(equalTo: lbLetrasMin.bottomAnchor, constant: Metrics.margin),
            lbNumeros.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metrics.margin),
            lbNumeros.trailingAnchor.constraint(equalTo: swUsarNumeros.leadingAnchor, constant: -Metrics.margin)
        ])
    }
    
    private func constraintUsarNumeros(){
        NSLayoutConstraint.activate([
            swUsarNumeros.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Metrics.margin),
            swUsarNumeros.centerYAnchor.constraint(equalTo: lbNumeros.centerYAnchor)
        ])
    }
    
    private func constraintLbLetrasMaiusculas(){
        NSLayoutConstraint.activate([
            lbLetrasMai.topAnchor.constraint(equalTo: lbNumeros.bottomAnchor, constant: Metrics.margin),
            lbLetrasMai.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metrics.margin),
            lbLetrasMai.trailingAnchor.constraint(equalTo: swLetrasMai.leadingAnchor, constant: -Metrics.margin)
        ])
    }
    
    private func constraintUsarLetrasMai(){
        NSLayoutConstraint.activate([
            swLetrasMai.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Metrics.margin),
            swLetrasMai.centerYAnchor.constraint(equalTo: lbLetrasMai.centerYAnchor)
        ])
    }
    
    private func constraintLbCaracteresEspeciais(){
        NSLayoutConstraint.activate([
            lbSpecialChar.topAnchor.constraint(equalTo: lbLetrasMai.bottomAnchor, constant: Metrics.margin),
            lbSpecialChar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metrics.margin),
            lbSpecialChar.trailingAnchor.constraint(equalTo: swSpecialChar.leadingAnchor, constant: -Metrics.margin)
        ])
    }
    
    private func constraintCaracteresEspeciais(){
        NSLayoutConstraint.activate([
            swSpecialChar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Metrics.margin),
            swSpecialChar.centerYAnchor.constraint(equalTo: lbSpecialChar.centerYAnchor)
        ])
    }
    
    private func constraintBtGerarSenha(){
        NSLayoutConstraint.activate([
            btGerarSenha.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metrics.margin),
            btGerarSenha.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Metrics.margin),
            btGerarSenha.heightAnchor.constraint(equalToConstant: Metrics.buttonH),
            btGerarSenha.topAnchor.constraint(equalTo: swSpecialChar.bottomAnchor, constant: Metrics.margin)
        ])
    }
    
    private func constraintTextView(){
        NSLayoutConstraint.activate([
            tvPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metrics.margin),
            tvPassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Metrics.margin),
            tvPassword.topAnchor.constraint(equalTo: btGerarSenha.bottomAnchor, constant: Metrics.margin),
            tvPassword.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: Metrics.margin)
        ])
    }
    
    @objc func buttonAction(_ sender: UIButton!){
        passwordGenerator = PasswordGenerator(numberOfCharacters: Int(tfCharacters.text!)!, useLetters: swLetrasMin.isOn, useNumbers: swUsarNumeros.isOn, useCapitalLetters: swLetrasMai.isOn, useSpecialCharacters: swSpecialChar.isOn)
        
        tvPassword.scrollRangeToVisible(NSRange(location: 0, length: 0))
        tvPassword.text = ""
        let passwords = passwordGenerator.generate(total: Int(tfSenhas.text!)!)
        for password in passwords {
            tvPassword.text.append(password + "\n\n")
        }
    }
}




