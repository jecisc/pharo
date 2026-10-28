Extension { #name : 'ClyActivatorMenuItem' }

{ #category : '*Commander-Activators-ContextMenu' }
ClyActivatorMenuItem >> buildContextMenu: aMenuView [

	activator buildContextMenu: aMenuView
]

{ #category : '*Commander-Activators-ContextMenu' }
ClyActivatorMenuItem >> registerContextMenuItemsWithBuilder: aBuilder [

	activator registerContextMenuItemsFor: self withBuilder: aBuilder
]

{ #category : '*Commander-Activators-ContextMenu' }
ClyActivatorMenuItem >> setUpShortcutTipForMenuItem: aMenuItemMorph [

	self activator setUpShortcutTipForMenuItem: aMenuItemMorph
]
