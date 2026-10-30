"
I build the entries of a toolbar or of the notebook tab actions from the command activation strategies of one kind, for example ClyToolbarActivation. I collect the visible activations of each context with their activators. The toolbar is grouped by ClyToolbarGroup subclasses, while the tab actions are a flat list, both sorted by order and name.
"
Class {
	#name : 'ClyToolbarBuilder',
	#superclass : 'Object',
	#instVars : [
		'activationStrategyClass',
		'entries'
	],
	#category : 'Calypso-Commands',
	#package : 'Calypso-Commands'
}

{ #category : 'instance creation' }
ClyToolbarBuilder class >> activatedBy: aStrategyClass [

	^ self new
		  activationStrategyClass: aStrategyClass;
		  yourself
]

{ #category : 'accessing' }
ClyToolbarBuilder >> activationStrategyClass: anObject [
	activationStrategyClass := anObject
]

{ #category : 'building' }
ClyToolbarBuilder >> buildBrowserNotebookActions [
	^ (self sortedActivators: (entries collect: [ :entry | entry value ])) flatCollect: [ :each | each buildBrowserNotebookActions ]
]

{ #category : 'building' }
ClyToolbarBuilder >> buildBrowserToolbar: toolbarMorph [
	| byGroup |
	byGroup := entries groupedBy: [ :entry | entry key ].
	(byGroup keys asSortedCollection: [ :a :b | self isGroup: a beforeGroup: b ]) do: [ :groupClass |
		| activators |
		activators := self sortedActivators: ((byGroup at: groupClass) collect: [ :each | each value ]).
		(activators anySatisfy: [ :activator | activator canExecuteCommand ]) ifTrue: [
			toolbarMorph submorphs ifNotEmpty: [ toolbarMorph addNewItem: ClyToolbarSeparatorMorph new ].
			activators do: [ :activator | activator buildBrowserToolbar: toolbarMorph ] ] ]
]

{ #category : 'building' }
ClyToolbarBuilder >> buildInContext: aToolContext [
	activationStrategyClass
		visibleInstancesInContext: aToolContext
		do: [ :activation |
			entries add: activation menuGroup -> (activation newActivatorFor: aToolContext) ]
]

{ #category : 'accessing' }
ClyToolbarBuilder >> entries [
	^ entries
]

{ #category : 'initialization' }
ClyToolbarBuilder >> initialize [
	super initialize.
	entries := OrderedCollection new
]

{ #category : 'sorting' }
ClyToolbarBuilder >> isGroup: aGroupClass beforeGroup: anotherGroupClass [
	| group another |
	group := aGroupClass new.
	another := anotherGroupClass new.
	^ group order = another order
		ifTrue: [ group name <= another name ]
		ifFalse: [ group order <= another order ]
]

{ #category : 'sorting' }
ClyToolbarBuilder >> sortedActivators: activators [
	^ activators asSortedCollection: [ :a :b |
		a menuItemOrder = b menuItemOrder
			ifTrue: [ a menuItemName <= b menuItemName ]
			ifFalse: [ a menuItemOrder <= b menuItemOrder ] ]
]
