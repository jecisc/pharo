"
I am the root of the Calypso commands. I am a Commander2 command, and I keep the helper methods that the v1 activators and the Calypso morphs (toolbar, tab, table cells, context menus) still call on a command, so that commands can move off the Commander v1 base classes.
"
Class {
	#name : 'ClyCommand',
	#superclass : 'CmCommand',
	#instVars : [
		'dropContext',
		'prepared'
	],
	#category : 'Calypso-Commands',
	#package : 'Calypso-Commands'
}

{ #category : 'testing' }
ClyCommand class >> canBeExecutedInContext: aToolContext [
	^self isAbstract not
]

{ #category : 'spec2 compatibility' }
ClyCommand class >> defaultHelp [
	^ self defaultMenuItemName
]

{ #category : 'accessing' }
ClyCommand class >> defaultMenuIconName [
	"For compatibility the actual icon named can be defined on class side.
	But right way it to use same instance side method.

	Not really nice to return nil. But it is already expected by many tools.
	So it is easy to allow nil.
	But users should use instance side method defaultMenuIcon which should return Form instance"
	^nil
]

{ #category : 'accessing' }
ClyCommand class >> defaultMenuItemName [
	"It should be defined on instance side.
	But for compatibility default instance side method delegates to class side"
	^self name
]

{ #category : 'testing' }
ClyCommand class >> isAbstract [
	^self = ClyCommand
]

{ #category : 'testing' }
ClyCommand >> acceptVisitor: aVisitor [

	^ aVisitor visitCommand: self
]

{ #category : 'ui requests' }
ClyCommand >> application [

	^ StPharoApplication current
]

{ #category : 'execution' }
ClyCommand >> applyCommandResult [
	^ self
]

{ #category : 'testing' }
ClyCommand >> canBeExecuted [

	^ (self class canBeExecutedInContext: self context)
		and: [ self isAvailableInMenuOf: self context ]
]

{ #category : 'ui requests' }
ClyCommand >> confirm: aString [

	^ self application confirm:  aString
]

{ #category : 'accessing' }
ClyCommand >> defaultMenuIcon [

	^ self defaultMenuIconFormSet ifNotNil: [ :formSet | formSet asForm ]
]

{ #category : 'accessing' }
ClyCommand >> defaultMenuIconFormSet [
	"By default the result is nil which is not really nice
	but it is already expected by many tools.	So it is easy to allow nil.
	For simple cases users should implement class side method #defaultMenuIconName"
	^self defaultMenuIconName ifNotNil: [ :iconName |
		Smalltalk ui iconFormSetNamed: iconName ]
]

{ #category : 'accessing' }
ClyCommand >> defaultMenuIconName [
	"For compatibility it delegates actual logic to class side. But it should be just
		^nil
	Not really nice to return nil. But it is already expected by many tools.
	So it is easy to allow nil.
	When users want to define real icon instead of standard named icon
	they should override another instance side method #defaultMenuIcon
	which should return desired Form instance"
	^self class defaultMenuIconName
]

{ #category : 'accessing' }
ClyCommand >> defaultMenuItemName [
	"For compatibility default instance side method delegates to class side.
	But normally it should just return
		self class name"

	^self class defaultMenuItemName
]

{ #category : 'accessing' }
ClyCommand >> description [
	"By default the result is nil which is not really nice
	but it is already expected by many tools. So it is easy to allow nil"
	^nil
]

{ #category : 'context menu' }
ClyCommand >> doRegisterContextMenuItemsFor: aCommandItem withBuilder: aBuilder [
	| item itemOrder |
	itemOrder := aCommandItem order.
	aCommandItem parentGroup isRoot not & aCommandItem parentGroup isInlined ifTrue: [
		"When we are inlining we should try keep order according to the order of parent.
		So we just put item order as deimal addition to parent order"
		itemOrder := aCommandItem parentGroup order + (itemOrder / 10000000.0)].
	item := (aBuilder item: aCommandItem name)
		parent: aCommandItem actualParentGroup name;
		order: itemOrder;
		help: aCommandItem description;
		action: [aCommandItem executeCommand].

	aCommandItem setUpShortcutTipForMenuItem: item.
	self setUpIconForMenuItem: item
]

{ #category : 'accessing' }
ClyCommand >> dropContext [
	^ dropContext
]

{ #category : 'accessing' }
ClyCommand >> dropContext: aToolContext [
	dropContext := aToolContext
]

{ #category : 'execution' }
ClyCommand >> execute [

	(prepared or: [ self context isNil ])
		ifTrue: [ self executeRefactoring ]
		ifFalse: [
				[
					prepared := true.
					self prepareFullExecution.
					self isComplexRefactoring
						ifTrue: [ self executeComplexRefactoring ]
						ifFalse: [
								self executeRefactoring.
								self applyCommandResult ] ]
					on: Exception
					do: [ :exception | self processCommandFailure: exception ] ]
]

{ #category : 'execution' }
ClyCommand >> executeComplexRefactoring [

	"Same preview as the v1 path: apply the picked changes on OK, nothing on cancel."
	| submitDialog |
	submitDialog := SycRefactoringPreviewPresenter for: self scopes: self context refactoringScopes.
	submitDialog existChanges
		ifTrue: [
			submitDialog openDialog
				okAction: [
					submitDialog accept.
					self applyCommandResult ];
				cancelAction: [ :p | p beCancel ] ]
		ifFalse: [ submitDialog alert: 'There is no change produced by this refactoring' ].
	CmCommandAborted signal
]

{ #category : 'context menu' }
ClyCommand >> fillContextMenu: aMenu using: aCommandActivator [
	| item |

	item := aMenu
		add: aCommandActivator menuItemName
		target: aCommandActivator
		selector: #executeCommand.

	aCommandActivator setUpShortcutTipForMenuItem: item.
	self setUpIconForMenuItem: item.
	self description ifNotNil: [:d | item setBalloonText: d]
]

{ #category : 'accessing' }
ClyCommand >> fullBrowserOrder [

	^ self order
]

{ #category : 'accessing' }
ClyCommand >> icon [

	^ self defaultMenuIcon
]

{ #category : 'initialization' }
ClyCommand >> initialize [
	super initialize.
	prepared := false
]

{ #category : 'testing' }
ClyCommand >> isAvailableInMenuOf: aToolContext [

	^ true
]

{ #category : 'testing' }
ClyCommand >> isCommand [

	^ true
]

{ #category : 'testing' }
ClyCommand >> isGroup [

	^ false
]

{ #category : 'accessing' }
ClyCommand >> menuGroup [

	^ ClyRootMenuGroup
]

{ #category : 'accessing' }
ClyCommand >> morphicUIManager [

	^ MorphicUIManager new
]

{ #category : 'accessing' }
ClyCommand >> name [

	^ self defaultMenuItemName
]

{ #category : 'accessing' }
ClyCommand >> orderInContext: aToolContext [

	^ self order
]

{ #category : 'executing' }
ClyCommand >> prepareFullExecution [
	^ self
]

{ #category : 'accessing' }
ClyCommand >> prepared [
	^ prepared
]

{ #category : 'accessing' }
ClyCommand >> prepared: aBoolean [
	prepared := aBoolean
]

{ #category : 'execution' }
ClyCommand >> processCommandFailure: anException [

	context processFailure: anException of: self
]

{ #category : 'context menu' }
ClyCommand >> registerContextMenuItemsFor: aCommandItem withBuilder: aBuilder [

	^ self doRegisterContextMenuItemsFor: aCommandItem withBuilder: aBuilder
]

{ #category : 'accessing' }
ClyCommand >> secureMenuIcon [
	"In case when icon should be mandatory property of command
	users should call this method. It ensure Form instance
	which will indicate missing icon as a problem"

	^self defaultMenuIcon ifNil: [ Smalltalk ui iconNamed: #error ]
]

{ #category : 'context menu' }
ClyCommand >> setUpIconForMenuItem: menuItem [

	self defaultMenuIconFormSet ifNotNil: [:iconFormSet |
		menuItem iconFormSet: iconFormSet ]
]

{ #category : 'context menu' }
ClyCommand >> setUpIconNamed: aString forMenuItem: aMenuItemMorph [

	aMenuItemMorph icon: (aMenuItemMorph iconNamed: aString)
]

{ #category : 'accessing' }
ClyCommand >> specUIManager [

	^ SpAlertDialog new
]
