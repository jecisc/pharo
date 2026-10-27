Extension { #name : 'SycRemoveClassCommand' }

{ #category : '*Calypso-SystemTools-FullBrowser' }
SycRemoveClassCommand class >> fullBrowserShortcutActivation [
	<classAnnotation>

	^CmdShortcutActivation removalFor: ClyFullBrowserClassContext
]
