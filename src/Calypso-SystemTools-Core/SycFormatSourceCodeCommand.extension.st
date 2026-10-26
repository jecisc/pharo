Extension { #name : 'SycFormatSourceCodeCommand' }

{ #category : '*Calypso-SystemTools-Core' }
SycFormatSourceCodeCommand class >> methodEditorShorcutActivation [

	<classAnnotation>
	^ CmdShortcutActivation
		by: $f meta shift
		for: ClyTextEditorContext
]
