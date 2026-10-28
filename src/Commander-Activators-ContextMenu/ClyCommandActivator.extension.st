Extension { #name : 'ClyCommandActivator' }

{ #category : '*Commander-Activators-ContextMenu' }
ClyCommandActivator >> buildContextMenu: aMenu [

	self canExecuteCommand ifFalse: [ ^self ].

	command fillContextMenu: aMenu using: self
]

{ #category : '*Commander-Activators-ContextMenu' }
ClyCommandActivator >> registerContextMenuItemsFor: aCommandItem withBuilder: aBuilder [

	self canExecuteCommand ifFalse: [ ^self ].

	self command registerContextMenuItemsFor: aCommandItem withBuilder: aBuilder
]

{ #category : '*Commander-Activators-ContextMenu' }
ClyCommandActivator >> setUpShortcutTipForMenuItem: aMenuItemMorph [

	CmdShortcutActivation
		activeInstancesFor: self command class inContext: self context
		do: [ :shortcut |
			aMenuItemMorph keyText: (shortcut keyCombination acceptVisitor: OSPlatform current shortcutPrinter)]
]
