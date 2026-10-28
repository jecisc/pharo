Extension { #name : 'ClyMenu' }

{ #category : '*Calypso-Browser' }
ClyMenu >> buildBrowserNotebookActions [

	^ self rootGroup buildBrowserNotebookActions
]

{ #category : '*Calypso-Browser' }
ClyMenu >> buildBrowserToolbar: aToolbar [

	self rootGroup buildBrowserToolbar: aToolbar
]
