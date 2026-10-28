Extension { #name : 'SycOpenAdvancedDebuggingMenuCommand' }

{ #category : '*Calypso-SystemTools-Core' }
SycOpenAdvancedDebuggingMenuCommand class >> methodEditorShortcutActivation [
	<classAnnotation>

	^ClyShortcutActivation by: $h meta shift for: ClySourceCodeContext
]

{ #category : '*Calypso-SystemTools-Core' }
SycOpenAdvancedDebuggingMenuCommand class >> sourceCodeMenuActivation [
	<classAnnotation>

	^CmdContextMenuActivation byRootGroupItemOrder: 0.2 for: ClySourceCodeContext
]
