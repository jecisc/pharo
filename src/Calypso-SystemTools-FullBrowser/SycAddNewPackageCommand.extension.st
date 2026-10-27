Extension { #name : 'SycAddNewPackageCommand' }

{ #category : '*Calypso-SystemTools-FullBrowser' }
SycAddNewPackageCommand class >> fullBrowserShortcutActivation [
	<classAnnotation>

	^CmdShortcutActivation by: $k meta, $p meta for: ClyFullBrowserGlobalContext
]
