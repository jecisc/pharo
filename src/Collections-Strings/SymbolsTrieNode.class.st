Class {
	#name : #SymbolsTrieNode,
	#superclass : #IdentityDictionary,
	#instVars : [
		'#childrenNodes',
		'#parentNode',
		'#symbol => WeakSlot'
	],
	#category : #'Collections-Strings-Base'
}

{ #category : #'instance creation' }
SymbolsTrieNode class >> parentNode: aTrieNode [

	^ self new
		  parentNode: aTrieNode;
		  yourself
]

{ #category : #adding }
SymbolsTrieNode >> add: aString [

	^ self addIn: aString symbol: aString createSymbol
]

{ #category : #adding }
SymbolsTrieNode >> addAllSymbolsTo: aCollection [

	self isSymbol ifTrue: [ aCollection add: self symbol ].
	self keysAndValuesDo: [ :letter :node | node addAllSymbolsTo: aCollection ]
]

{ #category : #adding }
SymbolsTrieNode >> addIn: aString symbol: symbolToAdd [

	| node |
	node := self at: aString first ifAbsentPut: [ self class parentNode: self ].
	^ aString size = 1
		  ifTrue: [
			  node symbol: symbolToAdd.
			  symbolToAdd ]
		  ifFalse: [ node addIn: aString allButFirst symbol: symbolToAdd ]
]

{ #category : #testing }
SymbolsTrieNode >> includes: aString [

	| node |
	node := self at: aString first ifAbsent: [ ^ false ].

	aString size = 1 ifTrue: [ ^ node isSymbol ].

	^ node includes: aString allButFirst
]

{ #category : #initialization }
SymbolsTrieNode >> initialize [

	self class initializeSlots: self.
	super initialize.
]

{ #category : #initialization }
SymbolsTrieNode >> initialize: size [

	super initialize: size.
	self initialize
]

{ #category : #accessing }
SymbolsTrieNode >> isSymbol [

	^ symbol isNotNil
]

{ #category : #accessing }
SymbolsTrieNode >> parentNode [

	^ parentNode
]

{ #category : #accessing }
SymbolsTrieNode >> parentNode: anObject [

	parentNode := anObject
]

{ #category : #matching }
SymbolsTrieNode >> symbol [

	^ symbol
]

{ #category : #accessing }
SymbolsTrieNode >> symbol: aSymbol [

	symbol := aSymbol
]

{ #category : #enumerating }
SymbolsTrieNode >> symbolsDo: aBlock [

	self isSymbol ifTrue: [ aBlock value: self symbol ].
	self valuesDo: [ :value | value symbolsDo: aBlock ]
]
