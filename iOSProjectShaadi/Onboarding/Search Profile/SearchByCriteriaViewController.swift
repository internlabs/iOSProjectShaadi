//
//  SearchByCriteriaViewController.swift
//  ProjectShaadi
//
//  Created by Supriya Gunda on 27/07/24.
//

import UIKit

class SearchByCriteriaViewController: UIViewController {
    
    let viewModel = SearchByCriteriaViewModel()
    
    private lazy var backButton: UIButton = {
        let button =  UIButton(type: .custom)
        button.setImage(UIImage(systemName: "chevron.backward")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.text = "Discover the perfect match based on your preferances 🔍"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.alwaysBounceVertical = false
        tableView.alwaysBounceHorizontal = false
        tableView.bounces = false
        tableView.contentOffset = .zero
        tableView.contentInset = .zero
        tableView.showsHorizontalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.registerClass(CriteriaTableViewCell.self)
        tableView.registerHeaderFooterClass(CriteriaHeaderView.self)
        return tableView
    }()
    
    private lazy var showProfilesButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show me Profiles", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "KumbhSans-SemiBold", size: 16)
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor(named: "flamingoColor")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupNavigation()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        view.addSubview(showProfilesButton)
        
        setupConstraints()
    }
    
    // MARK: - Setup Navigation
    private func setupNavigation() {
        let customView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        customView.isUserInteractionEnabled = true
        backButton.translatesAutoresizingMaskIntoConstraints = false
        customView.addSubview(backButton)
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: customView.topAnchor, constant: 20),
            backButton.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 8),
            backButton.trailingAnchor.constraint(equalTo: customView.trailingAnchor),
            backButton.bottomAnchor.constraint(equalTo: customView.bottomAnchor)
           
        ])
        let customBarButtonItem = UIBarButtonItem(customView: customView)
        navigationItem.leftBarButtonItem = customBarButtonItem
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 40),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: showProfilesButton.topAnchor, constant: -40),
            
            showProfilesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            showProfilesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
            showProfilesButton.heightAnchor.constraint(equalToConstant: 55),
            showProfilesButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
        ])
    }
    
    // MARK: - Actions
    @objc private func backButtonTapped() {
        print("back button tapped")
        navigationController?.popViewController(animated: true)
    }
}

extension SearchByCriteriaViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Criteria.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CriteriaTableViewCell.className, for: indexPath) as? CriteriaTableViewCell else {
            return UITableViewCell(frame: .zero)
        }
        cell.configureCell(indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: CriteriaHeaderView.className) as? CriteriaHeaderView else {
            return nil
        }
        return headerView
    }
}


