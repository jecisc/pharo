"
I am a group of a Calypso context menu tree. I hold the items and the nested groups, sorted by their order and name. My subclasses are the groups which place the commands of a context menu.
"
Class {
	#name : 'ClyMenuGroup',
	#superclass : 'ClyMenuItem',
	#instVars : [
		'contents'
	],
	#category : 'Calypso-Commands',
	#package : 'Calypso-Commands'
}

{ #category : 'parents' }
ClyMenuGroup class >> parentGroup [
	^ClyRootMenuGroup
]

{ #category : 'accessing' }
ClyMenuGroup >> addItem: aMenuItem [
	aMenuItem parentGroup: self.
	contents add: aMenuItem
]

{ #category : 'accessing' }
ClyMenuGroup >> allGroupsWhich: aBlock [
	| result |
	result := OrderedCollection new.

	contents
		reject: [ :each | each isCommandItem ]
		thenDo: [ :each |
			(aBlock value: each) ifTrue: [ result add: each ].
			result addAll: (each allGroupsWhich: aBlock) ].

	^result
]

{ #category : 'accessing' }
ClyMenuGroup >> allItemsWhich: aBlock [
	| result |
	result := OrderedCollection new.

	contents do: [ :each |
		(aBlock value: each) ifTrue: [ result add: each ].
		each isCommandItem ifFalse: [
			result addAll: (each allItemsWhich: aBlock) ]].

	^result
]

{ #category : 'accessing' }
ClyMenuGroup >> commandItemLike: aCommandClass [

	^contents detect: [ :each |
		each isCommandItem and: [ each includesCommand: aCommandClass ]]
]

{ #category : 'accessing' }
ClyMenuGroup >> commands [
	^contents
		select: [ :each | each isCommandItem ]
		thenCollect: [ :each | each command ]
]

{ #category : 'accessing' }
ClyMenuGroup >> contents [
	^ contents
]

{ #category : 'accessing' }
ClyMenuGroup >> contents: anObject [
	contents := anObject
]

{ #category : 'accessing' }
ClyMenuGroup >> description [
	"By default the result is nil which is not really nice
	but it is already expected by many tools. So it is easy to allow nil"
	^nil
]

{ #category : 'accessing' }
ClyMenuGroup >> findGroupLike: menuGroupClass ifExists: foundBlock [

	contents detect: [ :each | each isKindOf: menuGroupClass] ifFound: foundBlock.

	contents do: [ :each | each findGroupLike: menuGroupClass ifExists: foundBlock ]
]

{ #category : 'accessing' }
ClyMenuGroup >> findItemSimilarTo: aMenuItem ifPresent: presentBlock ifAbsent: absentBlock [

	contents
		detect: [:each | each isSimilarTo: aMenuItem  ]
		ifFound: presentBlock
		ifNone: absentBlock
]

{ #category : 'accessing' }
ClyMenuGroup >> icon [
	"By default the result is nil which is not really nice
	but it is already expected by many tools.	So it is easy to allow nil.
	For simple cases users should implement method #iconName"
	^self iconName
		ifNotNil: [:iconName | Smalltalk ui iconNamed: iconName ]
]

{ #category : 'accessing' }
ClyMenuGroup >> iconName [
	"Not really nice to return nil. But it is already expected by many tools.
	So it is easy to allow nil.
	Users should use method #icon which returns Form instance"

	^nil
]

{ #category : 'testing' }
ClyMenuGroup >> includes: aMenuItem [
	^contents anySatisfy: [ :each | each isSimilarTo: aMenuItem ]
]

{ #category : 'testing' }
ClyMenuGroup >> includesCommand: aClass [
	"It answers only about itself without looking recursively into child groups"
	^contents anySatisfy: [:each |
		each isCommandItem and: [each includesCommand: aClass] ]
]

{ #category : 'initialization' }
ClyMenuGroup >> initialize [
	super initialize.
	contents := SortedCollection sortBlock: [ :a :b |
		a order = b order
			ifTrue: [ a name <= b name ]
			ifFalse: [ a order <= b order ]]
]

{ #category : 'testing' }
ClyMenuGroup >> isActive [
	^contents anySatisfy: [ :each | each isActive ]
]

{ #category : 'testing' }
ClyMenuGroup >> isCommandItem [
	^false
]

{ #category : 'testing' }
ClyMenuGroup >> isEmpty [
	^contents isEmpty
]

{ #category : 'testing' }
ClyMenuGroup >> isInlined [
	^false
]

{ #category : 'testing' }
ClyMenuGroup >> isLastActiveMenuItem: childMenuItem [

	contents reverseDo: [ :each |
		each isActive ifTrue: [ ^each == childMenuItem ] ].

	^false
]

{ #category : 'testing' }
ClyMenuGroup >> isLastMenuItem: childMenuItem [

	^contents last == childMenuItem and: [ self isLastInMenu ]
]

{ #category : 'testing' }
ClyMenuGroup >> isRoot [
	^false
]

{ #category : 'testing' }
ClyMenuGroup >> isSimilarTo: aMenuItem [
	^self class == aMenuItem class
]

{ #category : 'accessing' }
ClyMenuGroup >> name [
	^self class name
]

{ #category : 'accessing' }
ClyMenuGroup >> order [
	^500
]

{ #category : 'accessing' }
ClyMenuGroup >> removeItem: aGroupOrCommand [
	contents remove: aGroupOrCommand
]

{ #category : 'accessing' }
ClyMenuGroup >> size [
	^contents size
]

{ #category : 'updating' }
ClyMenuGroup >> synchronizeContentWith: anotherGroup [

	contents removeAllSuchThat: [ :each | (anotherGroup includes: each) not].
	anotherGroup contents do: [ :each |
		self
			findItemSimilarTo: each
			ifPresent: [ :existing |
				existing synchronizeContentWith: each.
				existing isEmpty ifTrue: [ self removeItem: existing ] ]
			ifAbsent: [ self addItem: each]]
]
