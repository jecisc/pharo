Class {
	#name : #SHCustomStyle,
	#superclass : #Object,
	#instVars : [
		'textAttributes'
	],
	#category : #'Shout-Styling'
}

{ #category : #accessing }
SHCustomStyle >> at: elementSymbol put: styleArray [

	self textAttributes at: elementSymbol put: styleArray
]

{ #category : #initialization }
SHCustomStyle >> initialize [

	super initialize.
	textAttributes := IdentityDictionary new
]

{ #category : #accessing }
SHCustomStyle >> textAttributes [

	^ textAttributes
]

{ #category : #accessing }
SHCustomStyle >> textAttributes: anObject [

	textAttributes := anObject
]
