Extension { #name : 'ClyMenuCommandActivationStrategy' }

{ #category : '*Commander-Activators-ContextMenu' }
ClyMenuCommandActivationStrategy class >> buildContextMenuFor: aMorph inContext: aToolContext [

	| menu |
	menu := self buildMenuInContext: aToolContext.
	^menu buildContextMenuFor: aMorph
]

{ #category : '*Commander-Activators-ContextMenu' }
ClyMenuCommandActivationStrategy class >> registerContextMenuOn: aBuilder inContext: aToolContext [
	| menu |
	menu := self buildMenuInContext: aToolContext.
	menu registerContextMenuItemsWithBuilder: aBuilder
]
