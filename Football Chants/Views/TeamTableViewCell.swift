//
//  TeamTableViewCell.swift
//  Football Chants
//
//  Created by Jacob Perez on 10/15/23.
//

import UIKit

protocol TeamTableViewCellDelegate: class {
    func didTapPlayback(for team: Team)
}

class TeamTableViewCell: UITableViewCell {
    
    static let cellID = "TeamTableViewCell"
    
    // MARK: - UI
    
    private lazy var containerView:  UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var contentStackView:  UIStackView = {
        let view = UIStackView()
        view.spacing = 4
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var badgeImgView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var playbackButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        return button
    }()
    
    private lazy var nameLabel:  UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 10, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    private lazy var foundedLabel:  UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    private lazy var jobLabel:  UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 10, weight: .light)
        label.textColor = .white
        return label
    }()
    
    private lazy var infoLabel:  UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    
    private weak var delegate: TeamTableViewCellDelegate?
    private var team: Team?
    
    // MARK: - Lifecycle
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.layer.cornerRadius = 10
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.team = nil
        self.delegate = nil
        self.contentView.subviews.forEach { $0.removeFromSuperview() }
    }
    
    func configure(with item: Team, delegate: TeamTableViewCellDelegate ) {
        
        self.team = item
        self.delegate = delegate
        
        playbackButton.addTarget(self, action: #selector(didTapPlayback), for: .touchUpInside)
        
        containerView.backgroundColor = item.id.background
        
        badgeImgView.image = item.id.badge
        //TERNARY OPPERATOR over IF STATEMENT
        playbackButton.setImage(item.isPlaying ? Assets.pause : Assets.play, for: .normal)
        
        nameLabel.text = item.name
        foundedLabel.text = item.founded
        jobLabel.text = "Current \(item.manager.job.rawValue): \(item.manager.name)"
        infoLabel.text = item.info
        
        self.contentView.addSubview(containerView)
        
        containerView.addSubview(contentStackView)
        containerView.addSubview(badgeImgView)
        containerView.addSubview(playbackButton)
        
        
        contentStackView.addArrangedSubview(nameLabel)
        contentStackView.addArrangedSubview(foundedLabel)
        contentStackView.addArrangedSubview(jobLabel)
        contentStackView.addArrangedSubview(infoLabel)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            containerView.bottomAnchor.constraint(equalTo:self.contentView.bottomAnchor, constant: -8),
            containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
            
            badgeImgView.heightAnchor.constraint(equalToConstant: 50),
            badgeImgView.widthAnchor.constraint(equalToConstant: 50),
            badgeImgView.topAnchor.constraint(equalTo: contentStackView.topAnchor),
            badgeImgView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            
            contentStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            contentStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            contentStackView.leadingAnchor.constraint(equalTo: badgeImgView.trailingAnchor, constant: 8),
            contentStackView.trailingAnchor.constraint(equalTo: playbackButton.leadingAnchor, constant: -8),
            
            playbackButton.heightAnchor.constraint(equalToConstant: 44),
            playbackButton.widthAnchor.constraint(equalToConstant: 44),
            playbackButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            playbackButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
    }
    @objc func didTapPlayback() {
//        print("The team that is selected:L \(team?.name)")
        if let team = team {
            delegate?.didTapPlayback(for: team)
        }
    }
    
}
