Extension { #name : 'SycRemoveVariablesCommand' }

{ #category : '*Calypso-SystemTools-FullBrowser' }
SycRemoveVariablesCommand class >> fullBrowserShortcutActivation [
	<classAnnotation>

	^ CmdShortcutActivation removalFor: ClyFullBrowserVariableContext
]
