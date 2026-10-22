"
I build a Commander2 command group (CmCommandGroup) for Calypso tools.

I take a base command class (a subclass of CmCommand) and a Calypso tool context.
I instantiate every concrete subclass of the base class with that context and register
the resulting commands that can be executed in that context in a CmCommandGroup,
preserving the order in which the class hierarchy returns them.

Use ClyCommandGroupMenuRenderer to display the produced group inside a Morphic menu.
"
Class {
	#name : 'ClyCommandGroupBuilder',
	#superclass : 'Object',
	#category : 'Calypso-Commands',
	#package : 'Calypso-Commands'
}

{ #category : 'instance creation' }
ClyCommandGroupBuilder class >> buildFor: aCommandClass context: aContext [

	^ self new
		  buildFor: aCommandClass
		  context: aContext
]

{ #category : 'instance creation' }
ClyCommandGroupBuilder class >> buildSortedFor: aCommandClass context: aContext [

	^ self new buildFor: aCommandClass context: aContext sorted: true
]

{ #category : 'building' }
ClyCommandGroupBuilder >> buildFor: aCommandClass context: aContext [

	^ self buildFor: aCommandClass context: aContext sorted: false
]

{ #category : 'building' }
ClyCommandGroupBuilder >> buildFor: aCommandClass context: aContext sorted: aBoolean [

	| commands group |
	commands := OrderedCollection new.
	aCommandClass allSubclasses do: [ :aClass |
			| command |
			aClass hasAbstractMethods ifFalse: [
					command := aClass new
						           context: aContext;
						           yourself.
					command canBeExecuted ifTrue: [ commands add: command ] ] ].
	aBoolean ifTrue: [ commands := self sortedByOrder: commands ].
	group := CmCommandGroup named: aCommandClass name asString.
	commands do: [ :comm | group register: comm ].
	^ group
]

{ #category : 'private' }
ClyCommandGroupBuilder >> sortedByOrder: commands [
	"Compatibility method that should be removed in the future"

	| index |
	index := 0.
	^ ((commands collect: [ :command |
			    index := index + 1.
			    command -> index ]) asSortedCollection: [ :a :b | a key order < b key order or: [ a key order = b key order and: [ a value <= b value ] ] ]) collect: [ :association | association key ]
]
