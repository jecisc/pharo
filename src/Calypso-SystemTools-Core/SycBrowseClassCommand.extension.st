Extension { #name : 'SycBrowseClassCommand' }

{ #category : '*Calypso-SystemTools-Core' }
SycBrowseClassCommand class >> browserContextMenuActivation [ 

	^ CmdContextMenuActivation 
		byRootGroupItemOrder: 1 
		for: ClyClass asCalypsoItemContext 
]
