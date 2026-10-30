Extension { #name : 'ClyCommand' }

{ #category : '*Calypso-Browser' }
ClyCommand >> addToolbarItemInto: toolbarMorph using: aCommandActivator [

	| item |
	item := self createToolbarItemFor: aCommandActivator.
	self decorateToolbarItem: item.
	toolbarMorph addNewItem: item
]

{ #category : '*Calypso-Browser' }
ClyCommand >> browserTabActionIcon [

	^self secureMenuIcon
]

{ #category : '*Calypso-Browser' }
ClyCommand >> buildBrowserNotebookActionsUsing: aCommandActivator [

	^ { ClyNotebookPageActionButtonMorph forAction: (ClyNotebookPageAction
		action: [ aCommandActivator executeCommand ]
		icon: self browserTabActionIcon
		label: aCommandActivator commandDescription) }
]

{ #category : '*Calypso-Browser' }
ClyCommand >> createTableCellButtonUsing: aCommandActivator [

	| icon |
	icon := self tableCellIcon.

	^self createTableCellButtonWith: icon using: aCommandActivator
]

{ #category : '*Calypso-Browser' }
ClyCommand >> createTableCellButtonWith: anIcon using: aCommandActivator [

	^IconicButtonMorph new
		target: aCommandActivator;
		actionSelector: #executeCommand;
		color: Color transparent;
		helpText: self name;
		borderWidth: 0;
		labelGraphic: anIcon;
		extent: anIcon extent
]

{ #category : '*Calypso-Browser' }
ClyCommand >> createToolbarItemFor: aCommandActivator [

	^ClyBrowserButtonMorph activatingBy: aCommandActivator
]

{ #category : '*Calypso-Browser' }
ClyCommand >> decorateTableCell: anItemCellMorph using: aCommandActivator [

	| button |
	button := self createTableCellButtonUsing: aCommandActivator.

	self decorateTableCell: anItemCellMorph with: button
]

{ #category : '*Calypso-Browser' }
ClyCommand >> decorateTableCell: anItemCellMorph with: aMorph [

	anItemCellMorph definitionMorph: aMorph
]

{ #category : '*Calypso-Browser' }
ClyCommand >> decorateToolbarItem: aBrowserToolbarItem [

	self description ifNotNil: [ :d |
		aBrowserToolbarItem setBalloonText: d ].

	self defaultMenuIconFormSet ifNotNil: [:iconFormSet |
		aBrowserToolbarItem addIcon: iconFormSet asMorph]
]

{ #category : '*Calypso-Browser' }
ClyCommand >> defaultToolbarItemName [
	^self name
]

{ #category : '*Calypso-Browser' }
ClyCommand >> tableCellIcon [

	^self secureMenuIcon
]
