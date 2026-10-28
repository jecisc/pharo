Extension { #name : 'ClyCommand' }

{ #category : '*Commander-Activators-ContextMenu' }
ClyCommand >> doRegisterContextMenuItemsFor: aCommandItem withBuilder: aBuilder [
	| item itemOrder |
	itemOrder := aCommandItem order.
	aCommandItem parentGroup isRoot not & aCommandItem parentGroup isInlined ifTrue: [
		"When we are inlining we should try keep order according to the order of parent.
		So we just put item order as deimal addition to parent order"
		itemOrder := aCommandItem parentGroup order + (itemOrder / 10000000.0)].
	item := (aBuilder item: aCommandItem name)
		parent: aCommandItem actualParentGroup name;
		order: itemOrder;
		help: aCommandItem description;
		action: [aCommandItem executeCommand].

	aCommandItem setUpShortcutTipForMenuItem: item.
	self setUpIconForMenuItem: item
]

{ #category : '*Commander-Activators-ContextMenu' }
ClyCommand >> fillContextMenu: aMenu using: aCommandActivator [
	| item |

	item := aMenu
		add: aCommandActivator menuItemName
		target: aCommandActivator
		selector: #executeCommand.

	aCommandActivator setUpShortcutTipForMenuItem: item.
	self setUpIconForMenuItem: item.
	self description ifNotNil: [:d | item setBalloonText: d]
]

{ #category : '*Commander-Activators-ContextMenu' }
ClyCommand >> registerContextMenuItemsFor: aCommandItem withBuilder: aBuilder [

	^ self doRegisterContextMenuItemsFor: aCommandItem withBuilder: aBuilder
]

{ #category : '*Commander-Activators-ContextMenu' }
ClyCommand >> setUpIconForMenuItem: menuItem [

	self defaultMenuIconFormSet ifNotNil: [:iconFormSet |
		menuItem iconFormSet: iconFormSet ]
]

{ #category : '*Commander-Activators-ContextMenu' }
ClyCommand >> setUpIconNamed: aString forMenuItem: aMenuItemMorph [

	aMenuItemMorph icon: (aMenuItemMorph iconNamed: aString)
]
