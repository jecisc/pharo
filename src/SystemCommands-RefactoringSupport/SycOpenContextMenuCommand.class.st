"
I am a command to open special context menu.
I show in menu all commands annotated by activationStrategy class
"
Class {
	#name : 'SycOpenContextMenuCommand',
	#superclass : 'ClyOpenContextMenuCommand',
	#category : 'SystemCommands-RefactoringSupport',
	#package : 'SystemCommands-RefactoringSupport'
}

{ #category : 'execution' }
SycOpenContextMenuCommand >> addClyCommandsToMenu: aMenuMorph [

	self cmCommandClass
		addMenuItemsTo: aMenuMorph
		onContext: self context
]

{ #category : 'registering' }
SycOpenContextMenuCommand >> addPureItemsTo: aPresentedRoot [
	"The pure commands of cmCommandClass are added to the sub-menu of a pragma menu builder only when their own activation strategy is the strategy of this sub-menu, as addItemsToSubmenu:forContext: did."
	| commands |
	self cmCommandClass activationStrategy = self activationStrategy ifFalse: [ ^ self ].
	commands := self cmCommandClass subclasses
		collect: [ :each | each new context: self context; yourself ]
		thenSelect: [ :each | each isApplicable ].
	commands do: [ :each |
		aPresentedRoot register: (ClyPresentedCommand new
			decorate: each;
			identifier: each class name;
			yourself) ]
]

{ #category : 'context menu' }
SycOpenContextMenuCommand >> cmCommandClass [
	self subclassResponsibility
]

{ #category : 'execution' }
SycOpenContextMenuCommand >> createContextMenu [

	| menuMorph |
	menuMorph := super createContextMenu.
	self addClyCommandsToMenu: menuMorph.
	^ menuMorph
]
