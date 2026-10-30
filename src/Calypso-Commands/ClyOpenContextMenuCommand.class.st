"
I am the base of the commands which open a context menu of a Calypso tool. My subclasses provide the activation strategy whose commands make up the menu, and I open the menu on the context I was executed in.
"
Class {
	#name : 'ClyOpenContextMenuCommand',
	#superclass : 'ClyCommand',
	#category : 'Calypso-Commands',
	#package : 'Calypso-Commands'
}

{ #category : 'testing' }
ClyOpenContextMenuCommand class >> isAbstract [
	^self = ClyOpenContextMenuCommand
]

{ #category : 'execution' }
ClyOpenContextMenuCommand >> activationStrategy [
	"Subclasses should return specific kind of activation strategy
	which will be used to collect self context menu commands"
	self subclassResponsibility
]

{ #category : 'registering' }
ClyOpenContextMenuCommand >> addPureItemsTo: aPresentedRoot [
	"Hook: the pure commands an opener adds to its sub-menu. None by default."
	^ self
]

{ #category : 'building' }
ClyOpenContextMenuCommand >> createContextMenu [
	"The activation part of the sub-menu, built as the Commander2 tree and drawn by its renderer. The pure commands are added afterwards by each opener (addClyCommandsToMenu:), unchanged."
	^ ClyCommandGroupMenuRenderer new
		renderTree: (ClyCommandGroupBuilder new buildMenuFor: self activationStrategy context: self context pureRoots: #())
		on: self context tool
]

{ #category : 'execution' }
ClyOpenContextMenuCommand >> execute [

	| menu |
	menu := self createContextMenu.
	menu hasItems ifFalse: [^self].

	menu setInvokingView: self context tool.
	menu invokeModal
]

{ #category : 'context menu' }
ClyOpenContextMenuCommand >> fillContextMenu: aMenu using: aCommandActivator [
	"Here we need to take care because this command itself is added to menu of same self context.
	So we will always enter into this method during submenu generation.
	We catch this recursion using RecursionStopper.
	It is easier than adding extra logic to menu building process"
	| submenu |
	RecursionStopper during: [
		submenu := self createContextMenu.
		submenu hasItems ifFalse: [ ^self ].

		super fillContextMenu: aMenu using: aCommandActivator.
		aMenu lastItem subMenu: submenu
	]
]

{ #category : 'accessing' }
ClyOpenContextMenuCommand >> name [
	^ 'Open self context menu'
]

{ #category : 'registering' }
ClyOpenContextMenuCommand >> registerPresented: aPresentedCommand on: aBuilder inGroup: aGroup actualName: actualName [
	"The sub-menu of an opener in a pragma menu builder: registered only when its activations are active (the pure commands of addPureItemsTo: do not count), under the opener label."
	RecursionStopper during: [ | submenu |
		submenu := ClyCommandGroupBuilder new buildMenuFor: self activationStrategy context: self context pureRoots: #().
		submenu isActive ifTrue: [
			self registerActivationItem: aPresentedCommand on: aBuilder inGroup: aGroup actualName: actualName.
			self addPureItemsTo: submenu.
			ClyCommandGroupMenuRenderer new registerTree: submenu on: aBuilder rootName: aPresentedCommand dynamicName ] ]
]
