Extension { #name : 'SycRenamePackageCommand' }

{ #category : '*Calypso-SystemTools-FullBrowser' }
SycRenamePackageCommand class >> fullBrowserShortcutActivation [
	<classAnnotation>

	^CmdShortcutActivation renamingFor: ClyFullBrowserPackageContext
]
