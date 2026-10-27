Extension { #name : 'SycRenameClassCommand2' }

{ #category : '*Calypso-SystemTools-Core' }
SycRenameClassCommand2 class >> browserShortcutActivation [
	<classAnnotation>
	
	^CmdShortcutActivation renamingFor: ClyClass asCalypsoItemContext
]

{ #category : '*Calypso-SystemTools-Core' }
SycRenameClassCommand2 class >> sourceCodeShortcutActivation [
	<classAnnotation>

	^CmdShortcutActivation renamingFor: ClySourceCodeContext
]
