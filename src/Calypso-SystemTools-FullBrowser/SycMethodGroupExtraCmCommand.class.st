"
Root of the Extras commands of the variable and inherited method group menus of the full browser. The commands work on the selection of the context.
"
Class {
	#name : 'SycMethodGroupExtraCmCommand',
	#superclass : 'SycCmCommand',
	#category : 'Calypso-SystemTools-FullBrowser',
	#package : 'Calypso-SystemTools-FullBrowser'
}

{ #category : 'accessing' }
SycMethodGroupExtraCmCommand class >> activationStrategy [

	^ SycExtraMenuActivation
]
