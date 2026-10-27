Extension { #name : 'SycRemovePackageCommand' }

{ #category : '*Calypso-SystemTools-FullBrowser' }
SycRemovePackageCommand class >> fullBrowserShortcutActivation [
	<classAnnotation>

	^CmdShortcutActivation removalFor: ClyFullBrowserPackageContext
]
