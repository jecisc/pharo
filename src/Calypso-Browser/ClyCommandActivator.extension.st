Extension { #name : 'ClyCommandActivator' }

{ #category : '*Calypso-Browser' }
ClyCommandActivator >> buildBrowserNotebookActions [

	self canExecuteCommand ifFalse: [ ^ #(  ) ].

	^ self command buildBrowserNotebookActionsUsing: self
]

{ #category : '*Calypso-Browser' }
ClyCommandActivator >> buildBrowserToolbar: toolbarMorph [

	self canExecuteCommand ifFalse: [ ^ self ].

	self command addToolbarItemInto: toolbarMorph using: self
]

{ #category : '*Calypso-Browser' }
ClyCommandActivator >> decorateTableCell: anItemCellMorph [

	self command decorateTableCell: anItemCellMorph using: self
]

{ #category : '*Calypso-Browser' }
ClyCommandActivator >> isCommandAppliedToBrowser [

	^ self command isAppliedToBrowser
]
