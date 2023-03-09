Class {
	#name : #SHStyle,
	#superclass : #Object,
	#category : #'Shout-Styling'
}

{ #category : #testing }
SHStyle class >> isAbstract [

	^ self == SHStyle
]

{ #category : #accessing }
SHStyle class >> styleName [

	^ (self name withoutPrefix: 'SH') withoutSuffix: 'Style'
]

{ #category : #accessing }
SHStyle class >> styleNamed: aString [

	^ self stylers
		  detect: [ :class | class stylerName = aString ]
		  ifNone: [ self error: 'No style named ' , aString ]
]

{ #category : #accessing }
SHStyle class >> stylerName [

	^ self subclassResponsibility
]

{ #category : #accessing }
SHStyle class >> stylers [

	^ self allSubclasses reject: #isAbstract
]

{ #category : #accessing }
SHStyle >> textAttributes [

	^ ((Pragma allNamed: #shoutStyle: from: self class to: SHStyle) collect: [ :p | (p argumentAt: 1) -> (self perform: p methodSelector) ]) as: IdentityDictionary
]
