Extension { #name : 'ClyMenuGroup' }

{ #category : '*Commander-Activators-ContextMenu' }
ClyMenuGroup >> buildContextMenu: aMenu [

	self isInlined
		ifTrue: [ self inlineContextMenuItemsInto: aMenu ]
		ifFalse: [ self buildContextSubMenuIn: aMenu ]
]

{ #category : '*Commander-Activators-ContextMenu' }
ClyMenuGroup >> buildContextSubMenuIn: aMenu [

	| submenu |
	submenu := MorphicUIManager new
		           newMenuIn: aMenu defaultTarget
		           for: aMenu defaultTarget.

	self contents do: [ :each | each buildContextMenu: submenu ].

	submenu hasItems ifTrue: [
		aMenu add: self name icon: self icon subMenu: submenu.
		self description ifNotNil: [ :d | aMenu lastItem setBalloonText: d ] ]
]

{ #category : '*Commander-Activators-ContextMenu' }
ClyMenuGroup >> inlineContextMenuItemsInto: aMenu [

	aMenu addLine.

	self contents do: [ :each | each buildContextMenu: aMenu ].

	aMenu addLine
]

{ #category : '*Commander-Activators-ContextMenu' }
ClyMenuGroup >> registerContextMenuItemsWithBuilder: aBuilder [

	self isActive ifFalse: [ ^self ].

	self isInlined
		ifTrue: [ aBuilder items ifNotEmpty: [aBuilder withSeparatorAfter] ]
		ifFalse: [ self registerContextSubMenuWithBuilder: aBuilder].

	contents do: [ :each |
		each registerContextMenuItemsWithBuilder: aBuilder ].

	self isInlined & aBuilder items notEmpty
		ifTrue: [ aBuilder withSeparatorAfter ]
]

{ #category : '*Commander-Activators-ContextMenu' }
ClyMenuGroup >> registerContextSubMenuWithBuilder: aBuilder [

	(aBuilder item: self name)
		order: self order;
		parent: self parentGroup name;
		target: self;
		icon: self icon;
		help: self description
]
