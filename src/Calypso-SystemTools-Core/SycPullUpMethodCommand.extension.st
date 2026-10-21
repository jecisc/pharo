Extension { #name : 'SycPullUpMethodCommand' }

{ #category : '*Calypso-SystemTools-Core' }
SycPullUpMethodCommand class >> methodShortcutActivation [
	
	<classAnnotation>
	^CmdShortcutActivation by: $p meta, $u meta for: ClyMethod asCalypsoItemContext
]
