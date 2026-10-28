Extension { #name : 'ClyMenuGroup' }

{ #category : '*Calypso-Browser' }
ClyMenuGroup >> buildBrowserNotebookActions [

	self isActive ifFalse: [ ^ #(  ) ].

	^ self contents flatCollect: [ :each | each buildBrowserNotebookActions ]
]

{ #category : '*Calypso-Browser' }
ClyMenuGroup >> buildBrowserToolbar: toolbarMorph [

	self isActive ifFalse: [ ^ self ].
	toolbarMorph submorphs ifNotEmpty: [ toolbarMorph addNewItem: ClyToolbarSeparatorMorph new ].
	self contents do: [ :each | each buildBrowserToolbar: toolbarMorph ]
]
