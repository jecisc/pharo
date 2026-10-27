Extension { #name : 'SycDuplicatePackageCommand' }

{ #category : '*Calypso-SystemTools-FullBrowser' }
SycDuplicatePackageCommand class >> fullBrowserShortcutActivation [
	<classAnnotation>

	^CmdShortcutActivation by: $c meta for: ClyFullBrowserPackageContext
]
