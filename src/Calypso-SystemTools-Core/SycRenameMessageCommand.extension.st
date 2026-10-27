Extension { #name : 'SycRenameMessageCommand' }

{ #category : '*Calypso-SystemTools-Core' }
SycRenameMessageCommand class >> methodShortcutActivation [
	<classAnnotation>

	^CmdShortcutActivation renamingFor: ClyMethod asCalypsoItemContext
]

{ #category : '*Calypso-SystemTools-Core' }
SycRenameMessageCommand class >> sourceCodeShortcutActivation [

	<classAnnotation>
	^ CmdShortcutActivation by: $r meta for: ClyMethodSourceCodeContext
]
