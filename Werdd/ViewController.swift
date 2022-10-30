//
//  ViewController.swift
//  Werdd
//
//  Created by Jeremy Stewart on 10/4/22.
//

import UIKit

struct Definition {
    let word: String
    let partOfSpeech: String
    let meaning: String
}

// Custom cell from UITableViewCell that will go into cell near bottom of code
class TableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(roundedCellView)
        roundedCellView.addSubview(stackView)
        stackView.addArrangedSubview(word)
        stackView.addArrangedSubview(partOfSpeach)
        roundedCellView.addSubview(definitionLabel)
        
        //stackView.addArrangedSubview(UIView())
        
       
        //        roundedView.topAnchor.constraint(equalTo: werddLabel.bottomAnchor, constant: 18),
        //        roundedView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
        //        roundedView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
        //        roundedView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -528),
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: roundedCellView.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: roundedCellView.leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: roundedCellView.trailingAnchor, constant: -15),
            
            
            definitionLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 3),
            definitionLabel.leadingAnchor.constraint(equalTo: roundedCellView.leadingAnchor, constant: 15),
            definitionLabel.trailingAnchor.constraint(equalTo: roundedCellView.trailingAnchor, constant: -15),
            definitionLabel.bottomAnchor.constraint(equalTo: roundedCellView.bottomAnchor, constant: -5),
            
            roundedCellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            roundedCellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            roundedCellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            roundedCellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            
            ])
        
    }
    
    func updateDefinition(definition: Definition){
        word.text = definition.word
        partOfSpeach.text = definition.partOfSpeech
        definitionLabel.text = definition.meaning
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let roundedCellView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 252/255.0, green: 176/255.0, blue: 126/255.0, alpha: 0.5)
        view.layer.cornerRadius = 25
        
        return view
    }()
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 10
        
//
       // UIStackView.Distribution = .fillProportionally
        return stackView
    }()
    
    private let word: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = .black
        label.textAlignment = .left
        label.setContentHuggingPriority(UILayoutPriority.required, for: .horizontal)
        return label
    }()
    
    private let partOfSpeach: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        label.font = .italicSystemFont(ofSize: 18)
        label.textColor = .black
        label.textAlignment = .left
        label.setContentHuggingPriority(UILayoutPriority.defaultLow, for: .horizontal)
        return label
    }()
    
    private let definitionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
}




class ViewController: UIViewController {

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.layer.cornerRadius = 40
        tableView.separatorStyle = .none
        return tableView
    }()
    
    
    
    let definitionArray: [Definition] = [
        Definition( word: "Programming", partOfSpeech: "noun", meaning: "the process or activity of writing computer programs."),
        Definition(word: "Algorithm", partOfSpeech: "noun", meaning: "a process or set of rules to be followed in calculations or other problem-solving operations, especially by a computer."),
        Definition(word: "Array", partOfSpeech: "noun", meaning: "a collection of items, or data, stored in contiguous memory locations, also known as database systems."),
        Definition(word: "Data Structures", partOfSpeech: "noun", meaning: "a specialized format for organizing, processing, retrieving and storing data."),
        Definition(word: "Enumeration", partOfSpeech: "noun", meaning: "defines a common type for a group of related values and enables you to work with those values in a type-safe way within your code."),
        Definition(word: "Protocol", partOfSpeech: "noun", meaning: "defines a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality."),
        Definition(word: "Dictionary", partOfSpeech: "noun", meaning: "a type of hash table, providing fast access to the entries it contains. Each entry in the table is identified using its key, which is a hashable type such as a string or number."),
        Definition(word: "Closures", partOfSpeech: "noun", meaning: "self-contained blocks of functionality that can be passed around and used in your code."),
        Definition(word: "Functions", partOfSpeech: "noun", meaning: "self-contained chunks of code that perform a specific task."),
        Definition(word: "Methods", partOfSpeech: "noun", meaning: " functions that are associated with a particular type. Classes, structures, and enumerations can all define instance methods, which encapsulate specific tasks and functionality for working with an instance of a given type."),
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
        view.layer.cornerRadius = 35
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
         
        tableView.dataSource = self
            
        view.addSubview(werddLabel)
        view.addSubview(roundedView)
        view.addSubview(programmingLabel)
        view.addSubview(nounLabel)
        view.addSubview(defintionLabel)
        view.addSubview(randomButton)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            roundedView.topAnchor.constraint(equalTo: werddLabel.bottomAnchor, constant: 18),
            roundedView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            roundedView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            roundedView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -528),
    
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
            
            tableView.topAnchor.constraint(equalTo: roundedView.bottomAnchor, constant: 24),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    @objc func randomButtonPressed() {
        //print("random word is?")
        
        let randomDef = randomDefinition()
        updateDefinition(withDefinition: randomDef)
    }
    
    func randomDefinition() -> Definition? {
        return definitionArray.randomElement()
    }
    
    func updateDefinition(withDefinition definition: Definition?){
        programmingLabel.text = definition?.word
        nounLabel.text = definition?.partOfSpeech
        defintionLabel.text = definition?.meaning
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return definitionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableViewCell() //this is where Custom Cell Name will go
        
//        var werddDefinition = cell.defaultContentConfiguration()
//
//        werddDefinition.text = definitionArray[indexPath.row].word
//        //werddDefinition = definitionArray[indexPath.row].partOfSpeech
//        werddDefinition.secondaryText = definitionArray[indexPath.row].meaning
//        //cell.backgroundColor = .yellow
//
//
//        cell.contentConfiguration = werddDefinition
        
        cell.updateDefinition(definition: definitionArray[indexPath.row])
   
        return cell
    }

    
}
