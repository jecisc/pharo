Extension { #name : 'ClyFindClassCommand' }

{ #category : '*Calypso-SystemTools-FullBrowser' }
ClyFindClassCommand class >> fullBrowserShortcutActivation [
	<classAnnotation>

	^CmdShortcutActivation by: $f meta for: ClyFullBrowserGlobalContext
]
