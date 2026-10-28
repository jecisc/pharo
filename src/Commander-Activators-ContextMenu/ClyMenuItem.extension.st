Extension { #name : 'ClyMenuItem' }

{ #category : '*Commander-Activators-ContextMenu' }
ClyMenuItem >> buildContextMenu: aMenu [

	self subclassResponsibility
]

{ #category : '*Commander-Activators-ContextMenu' }
ClyMenuItem >> registerContextMenuItemsWithBuilder: aBuilder [

	self subclassResponsibility
]
