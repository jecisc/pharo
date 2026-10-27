"
I wrap a Commander2 command so that it can sit in a Commander v1 menu group (root group or Query group). I answer the menu group protocol (order, name, isActive, isCommandItem, parentGroup) by delegating to my command and my context, and I render or register myself through ClyCommandGroupMenuRenderer and the shortcut lookup of the v1 items. I am a temporary adapter and go away with the v1 menus.
"
Class {
	#name : 'ClyCommandMenuItem',
	#superclass : 'Object',
	#instVars : [
		'command',
		'parentGroup',
		'context'
	],
	#category : 'Calypso-Commands',
	#package : 'Calypso-Commands'
}

{ #category : 'instance creation' }
ClyCommandMenuItem class >> on: aCommand [

	^ self on: aCommand inContext: nil
]

{ #category : 'instance creation' }
ClyCommandMenuItem class >> on: aCommand inContext: aToolContext [

	^ self new
		command: aCommand;
		context: aToolContext;
		yourself
]

{ #category : 'accessing' }
ClyCommandMenuItem >> actualParentGroup [

	"Same rule as the v1 menu items: an inlined group registers its children under its own parent."
	parentGroup isRoot ifTrue: [ ^ parentGroup ].
	^ parentGroup isInlined
		ifTrue: [ parentGroup actualParentGroup ]
		ifFalse: [ parentGroup ]
]

{ #category : 'building' }
ClyCommandMenuItem >> buildContextMenu: aMenu [

	| item |
	item := ClyCommandGroupMenuRenderer new
		renderCommand: command
		on: aMenu.
	self setUpShortcutTipForMenuItem: item.
	^ item
]

{ #category : 'accessing' }
ClyCommandMenuItem >> command [

	^ command
]

{ #category : 'accessing' }
ClyCommandMenuItem >> command: aCommand [

	command := aCommand
]

{ #category : 'accessing' }
ClyCommandMenuItem >> context [

	^ context
]

{ #category : 'accessing' }
ClyCommandMenuItem >> context: aToolContext [

	context := aToolContext
]

{ #category : 'testing' }
ClyCommandMenuItem >> isActive [

	^ command canBeExecuted
]

{ #category : 'testing' }
ClyCommandMenuItem >> isCommandItem [

	^ true
]

{ #category : 'accessing' }
ClyCommandMenuItem >> name [

	^ command name
]

{ #category : 'accessing' }
ClyCommandMenuItem >> order [

	^ command orderInContext: context
]

{ #category : 'accessing' }
ClyCommandMenuItem >> parentGroup [

	^ parentGroup
]

{ #category : 'accessing' }
ClyCommandMenuItem >> parentGroup: aGroup [

	parentGroup := aGroup
]

{ #category : 'building' }
ClyCommandMenuItem >> registerContextMenuItemsWithBuilder: aBuilder [

	| itemOrder builderItem |
	itemOrder := self order.
	(parentGroup isRoot not and: [ parentGroup isInlined ])
		ifTrue: [ itemOrder := parentGroup order + (itemOrder / 10000000.0) ].
	builderItem := (aBuilder item: command name)
		parent: self actualParentGroup name;
		order: itemOrder;
		help: command description;
		action: [ command execute ];
		icon: command icon.
	self setUpShortcutTipForMenuItem: builderItem
]

{ #category : 'building' }
ClyCommandMenuItem >> setUpShortcutTipForMenuItem: aMenuItem [

	CmdShortcutActivation
		activeInstancesFor: command class
		inContext: context
		do: [ :shortcut |
			aMenuItem keyText: (shortcut keyCombination acceptVisitor: OSPlatform current shortcutPrinter) ]
]
