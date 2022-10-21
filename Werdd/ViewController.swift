//
//  ViewController.swift
//  Werdd
//
//  Created by Jeremy Stewart on 10/4/22.
//

import UIKit

struct definition {
    let word: String
    let partOfSpeech: String
    let meaning: String
}


class ViewController: UIViewController {

    let definitionArray: [definition] = [
        definition( word: "Programming", partOfSpeech: "Noun", meaning: "the process or activity of writing computer programs."),
        definition(word: "Algorithm", partOfSpeech: "Noun", meaning: "a process or set of rules to be followed in calculations or other problem-solving operations, especially by a computer."),
        definition(word: "Array", partOfSpeech: "Noun", meaning: "a collection of items, or data, stored in contiguous memory locations, also known as database systems."),
        definition(word: "Data Structures", partOfSpeech: "Noun", meaning: "a specialized format for organizing, processing, retrieving and storing data."),
        definition(word: "Enumeration", partOfSpeech: "Noun", meaning: "defines a common type for a group of related values and enables you to work with those values in a type-safe way within your code."),
        definition(word: "Protocol", partOfSpeech: "Noun", meaning: "defines a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality."),
        definition(word: "Dictionary", partOfSpeech: "Noun", meaning: "a type of hash table, providing fast access to the entries it contains. Each entry in the table is identified using its key, which is a hashable type such as a string or number."),
        definition(word: "Closures", partOfSpeech: "Noun", meaning: "self-contained blocks of functionality that can be passed around and used in your code."),
        definition(word: "Functions", partOfSpeech: "Noun", meaning: "self-contained chunks of code that perform a specific task."),
        definition(word: "Methods", partOfSpeech: "Noun", meaning: " functions that are associated with a particular type. Classes, structures, and enumerations can all define instance methods, which encapsulate specific tasks and functionality for working with an instance of a given type."),
    ]
    
    let programmingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Programming"
        label.font = UIFont(name: "Rubik-SemiBold", size: 29)
        return label
    }()
    
    let nounLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "noun"
        label.font = UIFont(name: "Rubik-Regular", size: 16)
        return label
    }()
    
    let defintionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Creating a sequence of instructions to enable the computer to do something."
        label.font = UIFont(name: "Rubik-Regular", size: 16)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    let roundedView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 53/255.0, green: 129/255.0, blue: 184/255.0, alpha: 0.6)
        view.layer.cornerRadius = 10
        return view
    }()
    
    let werddLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Werdd."
        label.font = UIFont(name: "Rubik-SemiBold", size: 36)
        label.textAlignment = .center
        return label
    }()
    
    
    
    lazy var randomButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 36, weight: .regular, scale: .medium)
        button.setImage(UIImage(systemName: "arrow.clockwise.circle", withConfiguration: largeConfig), for: .normal)
        button.tintColor = .white
        button.addTarget( self, action: #selector(randomButtonPressed), for: .touchUpInside)
        return button
    }()
    
    
        override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 233/255.0, green: 230/255.0, blue: 228/255.0, alpha: 1)
            
        view.addSubview(werddLabel)
        view.addSubview(roundedView)
        view.addSubview(programmingLabel)
        view.addSubview(nounLabel)
        view.addSubview(defintionLabel)
        view.addSubview(randomButton)
        
        NSLayoutConstraint.activate([
            roundedView.topAnchor.constraint(equalTo: werddLabel.bottomAnchor, constant: 18),
            roundedView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            roundedView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            roundedView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -409),
    
            werddLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 18),
            werddLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            
            programmingLabel.topAnchor.constraint(equalTo: roundedView.topAnchor,constant: 20),
            programmingLabel.leadingAnchor.constraint(equalTo: roundedView.leadingAnchor, constant: 24),
            
            nounLabel.topAnchor.constraint(equalTo: roundedView.topAnchor,constant: 32),
            nounLabel.leadingAnchor.constraint(equalTo: programmingLabel.trailingAnchor, constant: 4),
            
            defintionLabel.topAnchor.constraint(equalTo: programmingLabel.bottomAnchor,constant: 7),
            defintionLabel.leadingAnchor.constraint(equalTo: roundedView.leadingAnchor, constant: 24),
            defintionLabel.trailingAnchor.constraint(equalTo: roundedView.trailingAnchor, constant: -24),
            
            randomButton.trailingAnchor.constraint(equalTo: roundedView.trailingAnchor, constant: -12),
            randomButton.bottomAnchor.constraint(equalTo: roundedView.bottomAnchor, constant: -12),
            randomButton.heightAnchor.constraint(equalToConstant: 50),
            randomButton.widthAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc func randomButtonPressed() {
        //print("random word is?")
        
        let randomDef = randomDefinition()
        updateDefinition(withDefinition: randomDef)
    }
    
    func randomDefinition() -> definition? {
        return definitionArray.randomElement()
    }
    
    func updateDefinition(withDefinition defintion: definition?){
        programmingLabel.text = defintion?.word
        nounLabel.text = defintion?.partOfSpeech
        defintionLabel.text = defintion?.meaning
    }
}
