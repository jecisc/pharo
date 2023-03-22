Class {
	#name : #SymbolsTrie,
	#superclass : #Object,
	#instVars : [
		'roots'
	],
	#category : #'Collections-Strings-Base'
}

{ #category : #adding }
SymbolsTrie >> add: aString [

	aString ifEmpty: [ ^ self ].
	^ self roots add: aString
]

{ #category : #adding }
SymbolsTrie >> addAll: aCollection [

	aCollection do: [ :string | self add: string ]
]

{ #category : #accessing }
SymbolsTrie >> allSymbols [

	| words |
	words := OrderedCollection new.
	self roots addAllSymbolsTo: words.
	^ words
]

{ #category : #enumerating }
SymbolsTrie >> do: aBlock [

	self roots symbolsDo: aBlock
]

{ #category : #testing }
SymbolsTrie >> includes: aString [

	aString ifEmpty: [ self error: 'Cannot contain empty string' ].

	^ self roots includes: aString
]

{ #category : #initialization }
SymbolsTrie >> initialize [

	super initialize.
	self roots: SymbolsTrieNode new
]

{ #category : #accessing }
SymbolsTrie >> roots [
	^ roots
]

{ #category : #accessing }
SymbolsTrie >> roots: anObject [
	roots := anObject
]
