"
I am the menu of a Calypso tool built from one kind of command activation strategy, for example the context menu. I collect the activations visible in a context into the groups of my tree, and I build the menu items of the tool from it.
"
Class {
	#name : 'ClyMenu',
	#superclass : 'Object',
	#instVars : [
		'rootGroup',
		'activationStrategyClass'
	],
	#category : 'Calypso-Commands',
	#package : 'Calypso-Commands'
}

{ #category : 'instance creation' }
ClyMenu class >> activatedBy: aCommandActivationStrategyClass [

	^self new
		activationStrategyClass: aCommandActivationStrategyClass
]

{ #category : 'accessing' }
ClyMenu >> activationStrategyClass [
	^ activationStrategyClass
]

{ #category : 'accessing' }
ClyMenu >> activationStrategyClass: anObject [
	activationStrategyClass := anObject
]

{ #category : 'spec2 compatibility' }
ClyMenu >> asSpMenuPresenter [

	| menu |
	menu := SpMenuPresenter new.
	self rootGroup contents do: [ :each | each addToMenuPresenter: menu ].
	^ menu
]

{ #category : 'building' }
ClyMenu >> buildCommandItemInContext: aToolContext activatingBy: anActivationStrategy [

	| commandActivator group |
	commandActivator := anActivationStrategy newActivatorFor: aToolContext.

	group := self ensureGroup: anActivationStrategy menuGroup.
	group addItem: (ClyActivatorMenuItem activatingBy: commandActivator)
]

{ #category : 'context menu' }
ClyMenu >> buildContextMenuFor: aMorph [

	| menu |
	menu := MorphicUIManager new newMenuIn: aMorph for: aMorph.

	self rootGroup buildContextMenu: menu.

	menu hasSubmorphs ifTrue: [
		menu lastSubmorph isMenuLineMorph ifTrue: [
			menu lastSubmorph delete ] ].
	^ menu
]

{ #category : 'building' }
ClyMenu >> buildInContext: aToolContext [

	activationStrategyClass
		visibleInstancesInContext: aToolContext
		do: [ :activation |
			self buildCommandItemInContext: aToolContext activatingBy: activation]
]

{ #category : 'building' }
ClyMenu >> ensureGroup: menuGroupClass [

	| parentGroup group |
	rootGroup class = menuGroupClass ifTrue: [ ^rootGroup ].
	rootGroup findGroupLike: menuGroupClass ifExists: [:existing | ^existing].

	parentGroup := self ensureGroup: menuGroupClass parentGroup.
	group := menuGroupClass new.
	parentGroup addItem: group.
	^group
]

{ #category : 'accessing' }
ClyMenu >> groupsWithCommandLike: aCommandClass [

	| result |
	result := rootGroup allGroupsWhich: [ :each | each includesCommand: aCommandClass ].
	(rootGroup includesCommand: aCommandClass)
		ifTrue: [ result add: rootGroup ].
	^result
]

{ #category : 'initialization' }
ClyMenu >> initialize [
	super initialize.

	rootGroup := ClyRootMenuGroup new
]

{ #category : 'testing' }
ClyMenu >> isActive [
	^rootGroup isActive
]

{ #category : 'testing' }
ClyMenu >> isEmpty [
	^rootGroup isEmpty
]

{ #category : 'accessing' }
ClyMenu >> itemsWithCommandLike: aCommandClass [
	| groups |
	groups := self groupsWithCommandLike: aCommandClass.
	^groups
		flatCollect: [ :each | { each. each commandItemLike: aCommandClass } ]
]

{ #category : 'context menu' }
ClyMenu >> registerContextMenuItemsWithBuilder: aBuilder [

	rootGroup registerContextMenuItemsWithBuilder: aBuilder
]

{ #category : 'accessing' }
ClyMenu >> rootGroup [
	^ rootGroup
]

{ #category : 'accessing' }
ClyMenu >> rootGroup: anObject [
	rootGroup := anObject
]

{ #category : 'accessing' }
ClyMenu >> rootItems [
	^rootGroup contents
]
