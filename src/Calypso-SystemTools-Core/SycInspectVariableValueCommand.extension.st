Extension { #name : 'SycInspectVariableValueCommand' }

{ #category : '*Calypso-SystemTools-Core' }
SycInspectVariableValueCommand class >> sourceCodeShortcutActivation [
	<classAnnotation>

	^CmdShortcutActivation
		by: PharoShortcuts current inspectItShortcut for: ClySourceCodeContext
]
