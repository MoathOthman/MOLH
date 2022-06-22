//
//  StackViewTestViewController.swift
//  LocalizationHelperDemo
//
//  Created by Moath_Othman on 5/3/22.
//  Copyright © 2022 Moath. All rights reserved.
//

import UIKit

class StackViewTestViewController: UIViewController {

    @IBOutlet var label2: UILabel!
    @IBOutlet var label1: UILabel!
    private let noContentTextView = InformationTextView()

    override func viewDidLoad() {
        super.viewDidLoad()

        label1.text = NSLocalizedString("stack_view_label_1", comment: "")
        label2.text = NSLocalizedString("stack_view_label_2", comment: "")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        showNoContentView()
    }
    
    func showNoContentView() {
        noContentTextView.configure(text: "LocalizeLocalizeLocalize LocalizeLocalizeLocalize LocalizeLocalize Localize.no_apps_linked_disclaimer()")
        view.addSubview(noContentTextView)
        
        noContentTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            noContentTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            noContentTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            noContentTextView.heightAnchor.constraint(equalToConstant: 150),
            noContentTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    func hideNoContentView() {
        noContentTextView.removeFromSuperview()
    }
}

@IBDesignable
final class InformationTextView: NibBasedView {

    @IBOutlet private var textLabel: UILabel!

    func configure(text: String) {
        self.textLabel.text = text
        setup()
     }

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    func setup() {
        textLabel.numberOfLines = 0
        textLabel.lineBreakMode = .byWordWrapping
        textLabel.tag = -1
        backgroundColor = .clear
        
        textLabel.text = "Verhoi wlog io sad terhoi wlog io sad terhoi wlog io sad terhoi wlog io sad terhoi wlog io sad terhoi wlog io sad terhoi wlog io sad terhoi wlog io sad terhoi wlog io sad terhoi wlog io sad te "
    }
 
}


class NibBasedView: UIView {

    @IBOutlet private var contentView: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        if subviews.isEmpty {
            loadNib()
        }
    }

    private func loadNib() {
        let ttt = type(of: self)
        let classString = String(describing: ttt)
        let bundle = Bundle(for: ttt)

        if UINib(nibName: classString, bundle: bundle).instantiate(
            withOwner: self,
            options: nil).first as? UIView != nil {

            addSubview(contentView)
            contentView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                contentView.topAnchor.constraint(equalTo: topAnchor),
                contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
                contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
                contentView.trailingAnchor.constraint(equalTo: trailingAnchor)
            ])
        }

        style()
    }

    func style() {
        contentView.backgroundColor = .clear
        backgroundColor = .clear

    }
}
