Extension { #name : 'SycRenameVariableCommand' }

{ #category : '*Calypso-SystemTools-FullBrowser' }
SycRenameVariableCommand class >> fullBrowserShortcutActivation [

	<classAnnotation>
	^ CmdShortcutActivation renamingFor: ClyFullBrowserVariableContext
]
