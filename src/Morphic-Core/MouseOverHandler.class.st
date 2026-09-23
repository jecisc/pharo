"
Mouse over handler in a hand morph
"
Class {
	#name : 'MouseOverHandler',
	#superclass : 'Object',
	#instVars : [
		'mouseOverMorphs',
		'enteredMorphs',
		'overMorphs',
		'leftMorphs'
	],
	#category : 'Morphic-Core-Events',
	#package : 'Morphic-Core',
	#tag : 'Events'
}

{ #category : 'event handling' }
MouseOverHandler >> handleAsMouseEnter: anEvent [

	| asMouseEnterEvent |

	asMouseEnterEvent := anEvent asMouseEnter.
	enteredMorphs := enteredMorphs contents.
	enteredMorphs reverseDo: [ :anEnteredMorph |
		self inform: asMouseEnterEvent to: anEnteredMorph originatedFrom: anEvent ifNotFocusedDo: [] ]
]

{ #category : 'event handling' }
MouseOverHandler >> handleAsMouseLeave: anEvent [

	self keepLeftMorphsOrder.
	self informMouseLeaveToLeftMorphsUsing: anEvent
]

{ #category : 'event handling' }
MouseOverHandler >> handleAsMouseOver: anEvent [

	anEvent hand handleEvent: anEvent asMouseOver
]

{ #category : 'event handling' }
MouseOverHandler >> hasLeftMorphsChanged [

	^(leftMorphs isEmpty and: [ enteredMorphs position = 0 ]) not
]

{ #category : 'event handling' }
MouseOverHandler >> inform: evt to: aLeftMorph originatedFrom: anEvent ifNotFocusedDo: aBlock [

	^ (self is: anEvent withFocusOver: aLeftMorph)
		ifTrue: [ self transform: evt from: anEvent andSendTo: aLeftMorph ]
		ifFalse: [ aBlock value ]
]

{ #category : 'event handling' }
MouseOverHandler >> informMouseLeaveToLeftMorphsUsing: anEvent [

	| asMouseLeaveEvent |

	asMouseLeaveEvent := anEvent asMouseLeave.

	leftMorphs do: [ :aLeftMorph |
		self inform: asMouseLeaveEvent to: aLeftMorph originatedFrom: anEvent ifNotFocusedDo: [ overMorphs nextPut: aLeftMorph ] ]
]

{ #category : 'initialization' }
MouseOverHandler >> initialize [
	mouseOverMorphs := #().

	self initializeTrackedMorphs
]

{ #category : 'event handling' }
MouseOverHandler >> initializeProcessMouseOver [

	leftMorphs := mouseOverMorphs asIdentitySet.
	overMorphs := WriteStream on: (Array new: leftMorphs size).
	enteredMorphs := WriteStream on: #()
]

{ #category : 'initialization' }
MouseOverHandler >> initializeTrackedMorphs [

	leftMorphs := OrderedCollection new.
	overMorphs := WriteStream on: #().
	enteredMorphs := WriteStream on: #()
]

{ #category : 'event handling' }
MouseOverHandler >> is: anEvent withFocusOver: aMorph [

	| focusedMorph |

	focusedMorph := anEvent hand mouseFocus.
	^ aMorph = focusedMorph or: [ aMorph hasOwner: focusedMorph ]
]

{ #category : 'event handling' }
MouseOverHandler >> keepLeftMorphsOrder [

	leftMorphs size > 1 ifTrue: [ leftMorphs := mouseOverMorphs intersection: leftMorphs ]
]

{ #category : 'event handling' }
MouseOverHandler >> noticeMouseOver: aMorph event: anEvent [
	"Remember that the mouse is currently over some morph"

	leftMorphs remove: aMorph ifAbsent: [ enteredMorphs nextPut: aMorph ].
	overMorphs nextPut: aMorph
]

{ #category : 'event handling' }
MouseOverHandler >> processMouseOver: anEvent [

	self initializeProcessMouseOver.
	self handleAsMouseOver: anEvent.
	self hasLeftMorphsChanged ifTrue: [
		self handleAsMouseLeave: anEvent.
		self handleAsMouseEnter: anEvent.
		self rememberOverList ].

	self initializeTrackedMorphs
]

{ #category : 'event handling' }
MouseOverHandler >> rememberOverList [

	mouseOverMorphs := overMorphs contents
]

{ #category : 'event handling' }
MouseOverHandler >> transform: anEvent from: originalEvent andSendTo: aMorph [

	| transformedEvent |

	transformedEvent := anEvent transformedBy: (aMorph transformedFrom: originalEvent hand).
	^ aMorph handleEvent: transformedEvent
]
