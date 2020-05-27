import Foundation


// MARK: - Interface Initialization
//
extension NoteEditorViewController {

    @objc
    func setupStatusImageView() {
        statusImageView.image = NSImage(named: .simplenoteLogoInner)
        statusImageView.tintImage(color: .simplenotePlaceholderTintColor)
    }

    @objc
    func setupScrollView() {
        scrollView.contentView.postsBoundsChangedNotifications = true
    }

    @objc
    func setupTopDivider() {
        topDividerView.alphaValue = .zero
    }
}


// MARK: - Private Helpers
//
extension NoteEditorViewController {

    /// Indicates if there's a Note onScreen
    ///
    var isDisplayingNote: Bool {
        note != nil
    }

    /// Indicates if the Markdown Preview UI is active
    ///
    @objc
    var isDisplayingMarkdown: Bool {
        markdownViewController.parent != nil
    }

    /// Indicates if the current document is expected to support Markdown
    ///
    var isMarkdownEnabled: Bool {
        note?.markdown == true
    }

    /// Indicates if the current document can be shared
    ///
    var isShareEnabled: Bool {
        note?.content?.isEmpty == false
    }

    /// Indicates if there are multiple selected notes
    ///
    var isSelectingMultipleNotes: Bool {
        guard let selection = selectedNotes else {
            return false
        }

        return selection.count > 1
    }


    /// Refreshes the Editor's Inner State
    ///
    @objc
    func refreshEditorActions() {
        noteEditor.isEditable = isDisplayingNote && !viewingTrash
        noteEditor.isSelectable = isDisplayingNote && !viewingTrash
        noteEditor.isHidden = isDisplayingMarkdown
    }

    /// Refreshes the Toolbar's Inner State
    ///
    @objc
    func refreshToolbarActions() {
        let newState = ToolbarState(isDisplayingNote: isDisplayingNote,
                                    isDisplayingMarkdown: isDisplayingMarkdown,
                                    isMarkdownEnabled: isMarkdownEnabled,
                                    isShareEnabled: isShareEnabled,
                                    isSelectingMultipleNotes: isSelectingMultipleNotes,
                                    isViewingTrash: viewingTrash)
        toolbarView.state = newState

    }

    /// Refreshes the Tags Editor's Inner State
    ///
    @objc
    func refreshTagsEditor() {
        tagsView.displaysPlaceholder = isDisplayingNote && !viewingTrash
        tagsView.editable = isDisplayingNote && !viewingTrash
        tagsView.selectable = isDisplayingNote && !viewingTrash
        tagsView.tags = note?.tagsArray as? [String]
    }
}


// MARK: - Markdown Rendering
//
extension NoteEditorViewController {

    @objc(displayMarkdownPreview:)
    func displayMarkdownPreview(_ markdown: String) {
        markdownViewController.markdown = markdown

        let markdownView = markdownViewController.view
        markdownView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(markdownView)

        NSLayoutConstraint.activate([
            markdownView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            markdownView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            markdownView.topAnchor.constraint(equalTo: toolbarView.bottomAnchor),
            markdownView.bottomAnchor.constraint(equalTo: tagsView.topAnchor),
        ])

        addChild(markdownViewController)
    }

    @objc
    func dismissMarkdownPreview() {
        markdownViewController.markdown = nil
        markdownViewController.view.removeFromSuperview()
        markdownViewController.removeFromParent()
    }
}


// MARK: - Notifications
//
extension NoteEditorViewController {

    @objc
    func startListeningToScrollNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(clipViewDidScroll),
                                               name: NSView.boundsDidChangeNotification,
                                               object: scrollView.contentView)
    }

    @objc
    func clipViewDidScroll(sender: Notification) {
        refreshTopDividerAlpha()
    }

    func refreshTopDividerAlpha() {
        let contentOffSetY = scrollView.documentVisibleRect.origin.y
        let newAlpha = min(max(contentOffSetY / Settings.maximumAlphaGradientOffset, 0), 1)

        topDividerView.alphaValue = newAlpha
    }
}


// MARK: - Settings
//
private enum Settings {
    static let maximumAlphaGradientOffset = CGFloat(30)
}
