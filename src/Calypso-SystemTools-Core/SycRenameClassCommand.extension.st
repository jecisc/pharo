Extension { #name : 'SycRenameClassCommand' }

{ #category : '*Calypso-SystemTools-Core' }
SycRenameClassCommand class >> browserShortcutActivation [
"	<classAnnotation>"
	"Disabled to make the rename shortcut trigger the new solution."
	
	^CmdShortcutActivation renamingFor: ClyClass asCalypsoItemContext
]

{ #category : '*Calypso-SystemTools-Core' }
SycRenameClassCommand class >> sourceCodeShortcutActivation [
"	<classAnnotation>"
	"Disabled to make the rename shortcut trigger the new solution."

	^CmdShortcutActivation renamingFor: ClySourceCodeContext
]
