Extension { #name : 'SycMoveMethodsToClassSideCommand' }

{ #category : '*Calypso-SystemTools-Core' }
SycMoveMethodsToClassSideCommand class >> methodShortcutActivation [
	<classAnnotation>

	^CmdShortcutActivation by: $t meta, $c meta for: ClyMethod asCalypsoItemContext
]
