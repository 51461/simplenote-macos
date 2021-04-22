## Testing

### Setup 

- [ ] Sign up using mixed-capitalization in the email address. Use this account to run all tests below.

#### Login/Signup

- [ ] Welcome note is shown for newly signed-up user.
- [ ] Logout.
- [ ] Login with wrong password fails.
- [ ] Login with correct password succeeds.
- [ ] Login with WordPress.com succeeds.

#### Sync

- [ ] Created note appears in other device.
- [ ] Changes to new note sync to/from other device.
- [ ] New tag immediately syncs to/from other device.
- [ ] Removed tag immediately syncs to/from other device.
- [ ] Note publishes with link.
- [ ] Note unpublishes.
- [ ] Note publish change syncs _from_ other device (visible with dialog open).
- [ ] Markdown setting syncs to/from other device.
- [ ] Preview mode disappears/reappears when receiving remote changes to markdown setting.
- [ ] Note pinning syncs immediately to/from other device.
- [ ] Note pinning works regardless if done from list view or note info.
- [ ] Viewing history on one device leaves note unchanged on other device.
- [ ] Restoring history immediately syncs note to/from other device.
- [ ] Syncs when introducing sequential surrogate pairs sharing the same high surrogate, e.g. `🅰🅱` to `🅰🅰🅱`.

#### Note editor

- [ ] Can preview markdown with 👁 button.
- [ ] Can flip to edit mode with 👁 button.
- [ ] Using the Insert checklist item from the format menu inserts a checklist.
- [ ] "Undo" undoes the last edit.
- [ ] Typing `- [x]` creates a checked checklist item.
- [ ] Typing `- [ ]` created an unchecked checklist item.
- [ ] Typing `-`, `+`, or `*` creates a list.
- [ ] Changing `-` to `+` changes the list item bullet, also for `*` and `•` (`u2022`).
- [ ] Typing _tab_ in a list item underneath another list item indents item.
- [ ] All list bullet types render to markdown lists.
- [ ] Added URL is linkified.
- [ ] When clicking on link it opens in new window.
- [ ] Can print note in plaintext view.

#### Tags & search

- [ ] Can filter by tag when clicking on tag in tag drawer.
- [ ] Can add tag to note and have it appear in filtered tag view when previously not in filter.
- [ ] Can search by keyword, filtered instantly.
- [ ] Clearing the search field immediately updates filtered notes.
- [ ] Clicking on different tags or `All Notes` or `Trash` immediately updates filtered notes.
- [ ] Search field updates with results of `tag:test` format search string.

#### Trash

- [ ] Can trash note.
- [ ] Can view trashed notes by selecting `Trash`.
- [ ] Can right-click on `Trash` to empty trash.
- [ ] Can restore note from `Trash`.
- [ ] Can delete note forever from `Trash`.
- [ ] Trashing note selects the note below.
- [ ] Restoring note selects the note below.
- [ ] Deleting note forever selects the note below.

#### Settings

- [ ] Can toggle sidebar.
- [ ] Can change analytics sharing setting.
- [ ] Changing `Note Display` mode immediately updates and reflects in note list.
- [ ] Changing `Note Sorting` immediately updates and reflects in note list for each sort type.
- [ ] Changing `Tag Sorting` immediately updates and reflects in tag list.
- [ ] For each sort type the pinned notes appear first in the note list.
- [ ] Changing `Theme` immediately updates app for desired color scheme.
- [ ] With wide editor screen, toggling `View` > `Line Length` between `Narrow` and `Full` removes and adds border around note content appropriately and immediately.

#### Keyboard shortcuts ([reference](https://simplenote.com/help/#shortcuts))

- [ ] <kbd>Cmd</kbd> + <kbd>N</kbd> Create a new note.
- [ ] <kbd>Cmd</kbd> + <kbd>P</kbd> Print the selected note.
- [ ] <kbd>Cmd</kbd> + <kbd>+</kbd> Increase the font size.
- [ ] <kbd>Cmd</kbd> + <kbd>-</kbd> Decrease the font size.
- [ ] <kbd>Cmd</kbd> + <kbd>0</kbd> Reset the font size.
- [ ] <kbd>Cmd</kbd> + <kbd>Option</kbd> + <kbd>F</kbd> Toggle focus mode.
- [ ] <kbd>Cmd</kbd> + <kbd>Shift</kbd> + <kbd>F</kbd> Focus search field.
- [ ] <kbd>Cmd</kbd> + <kbd>Shift</kbd> + <kbd>C</kbd> Insert checklist.
- [ ] <kbd>Cmd</kbd> + <kbd>Shift</kbd> + <kbd>Y</kbd> Toggle between editing note and tags.
- [ ] <kbd>Cmd</kbd> + <kbd>Shift</kbd> + <kbd>P</kbd> Toggle markdown preview shortcut.
- [ ] <kbd>Cmd</kbd> + <kbd>T</kbd> Toggle sidebar.
