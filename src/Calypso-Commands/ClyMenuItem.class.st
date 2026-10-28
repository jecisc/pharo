"
I am an item of a Calypso context menu tree. I know the group I belong to, and I provide the order, the name and the activity of the items, as the groups and the menu items of the tree need them.
"
Class {
	#name : 'ClyMenuItem',
	#superclass : 'Object',
	#instVars : [
		'parentGroup'
	],
	#category : 'Calypso-Commands',
	#package : 'Calypso-Commands'
}

{ #category : 'accessing' }
ClyMenuItem >> actualParentGroup [
	parentGroup isRoot ifTrue: [ ^parentGroup ].

	^parentGroup isInlined
		ifTrue: [ parentGroup actualParentGroup ]
		ifFalse: [ parentGroup]
]

{ #category : 'accessing' }
ClyMenuItem >> description [
	self subclassResponsibility
]

{ #category : 'accessing' }
ClyMenuItem >> findGroupLike: menuGroupClass ifExists: aBlockClosure [
	self subclassResponsibility
]

{ #category : 'accessing' }
ClyMenuItem >> icon [
	self subclassResponsibility
]

{ #category : 'testing' }
ClyMenuItem >> includesCommand: aCommandClass [

	self subclassResponsibility
]

{ #category : 'testing' }
ClyMenuItem >> isActive [
	self subclassResponsibility
]

{ #category : 'testing' }
ClyMenuItem >> isCommandItem [
	^self subclassResponsibility
]

{ #category : 'testing' }
ClyMenuItem >> isEmpty [
	^false
]

{ #category : 'testing' }
ClyMenuItem >> isLastActiveItemInMenu [
	^parentGroup isLastActiveMenuItem: self
]

{ #category : 'testing' }
ClyMenuItem >> isLastInMenu [
	^parentGroup isLastMenuItem: self
]

{ #category : 'testing' }
ClyMenuItem >> isSimilarTo: aMenuItem [
	self subclassResponsibility
]

{ #category : 'accessing' }
ClyMenuItem >> name [
	self subclassResponsibility
]

{ #category : 'accessing' }
ClyMenuItem >> order [
	self subclassResponsibility
]

{ #category : 'accessing' }
ClyMenuItem >> parentGroup [
	^ parentGroup
]

{ #category : 'accessing' }
ClyMenuItem >> parentGroup: anObject [
	parentGroup := anObject
]

{ #category : 'accessing' }
ClyMenuItem >> pathToRoot [
	^parentGroup
		ifNil: [ ^#() ]
		ifNotNil: [ parentGroup pathToRoot, {parentGroup} ]
]

{ #category : 'updating' }
ClyMenuItem >> synchronizeContentWith: anotherMenuItem [
	self subclassResponsibility
]
