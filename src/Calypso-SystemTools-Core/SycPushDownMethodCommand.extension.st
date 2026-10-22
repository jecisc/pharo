Extension { #name : 'SycPushDownMethodCommand' }

{ #category : '*Calypso-SystemTools-Core' }
SycPushDownMethodCommand class >> methodShortcutActivation [
	<classAnnotation>

	^CmdShortcutActivation by: $p meta, $d meta for: ClyMethod asCalypsoItemContext
]
