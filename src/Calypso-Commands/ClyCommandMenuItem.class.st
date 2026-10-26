Class {
	#name : 'ClyCommandMenuItem',
	#superclass : 'Object',
	#instVars : [
		'command',
		'parentGroup'
	],
	#category : 'Calypso-Commands',
	#package : 'Calypso-Commands'
}

{ #category : 'instance creation' }
ClyCommandMenuItem class >> on: aCommand [

	^ self new
		command: aCommand;
		yourself
]

{ #category : 'building' }
ClyCommandMenuItem >> buildContextMenu: aMenu [

	^ ClyCommandGroupMenuRenderer new renderCommand: command on: aMenu
]

{ #category : 'accessing' }
ClyCommandMenuItem >> command [

	^ command
]

{ #category : 'accessing' }
ClyCommandMenuItem >> command: aCommand [

	command := aCommand
]

{ #category : 'testing' }
ClyCommandMenuItem >> isCommandItem [

	^ true
]

{ #category : 'accessing' }
ClyCommandMenuItem >> name [

	^ command name
]

{ #category : 'accessing' }
ClyCommandMenuItem >> order [

	^ command order
]

{ #category : 'accessing' }
ClyCommandMenuItem >> parentGroup [

	^ parentGroup
]

{ #category : 'accessing' }
ClyCommandMenuItem >> parentGroup: aGroup [

	parentGroup := aGroup
]

{ #category : 'building' }
ClyCommandMenuItem >> registerContextMenuItemsWithBuilder: aBuilder [

	| itemOrder |
	itemOrder := command order.
	(parentGroup isRoot not and: [ parentGroup isInlined ]) ifTrue: [ itemOrder := parentGroup order + (itemOrder / 10000000.0) ].
	(aBuilder item: command name)
		parent: parentGroup name;
		order: itemOrder;
		help: command description;
		action: [ command execute ];
		icon: command icon
]
