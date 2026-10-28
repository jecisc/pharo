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

{ #category : 'context menu' }
ClyOpenContextMenuCommand >> createContextMenu [

	^self activationStrategy buildContextMenuFor: self context tool inContext: self context
]

{ #category : 'accessing' }
ClyOpenContextMenuCommand >> defaultMenuItemName [
	^'Open self context menu'
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

{ #category : 'execution' }
ClyOpenContextMenuCommand >> readParametersFromContext: aToolContext [
	super readParametersFromContext: aToolContext.

	self context: aToolContext
]

{ #category : 'context menu' }
ClyOpenContextMenuCommand >> registerContextMenuItemsFor: aCommandItem withBuilder: aBuilder [
	"Here we need to take care because this command itself is added to menu of same self context.
	So we will always enter into this method during submenu generation.
	We catch this recursion using RecursionStopper.
	It is easier than adding extra logic to menu registration process"
	| submenu |
	RecursionStopper during: [
		submenu := self activationStrategy buildMenuInContext: self context.
		submenu isActive ifTrue: [
			self doRegisterContextMenuItemsFor: aCommandItem withBuilder: aBuilder.
			"Registration builder uses #name to bind children to parent"
			submenu rootGroup name: aCommandItem name.
			submenu registerContextMenuItemsWithBuilder: aBuilder]
	]
]
