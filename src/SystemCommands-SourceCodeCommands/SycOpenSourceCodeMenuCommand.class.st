"
I am a command to open special source code menu.
I show in menu all commands annotated by SycSourceCodeMenuActivation
"
Class {
	#name : 'SycOpenSourceCodeMenuCommand',
	#superclass : 'SycOpenContextMenuCommand',
	#category : 'SystemCommands-SourceCodeCommands',
	#package : 'SystemCommands-SourceCodeCommands'
}

{ #category : 'execution' }
SycOpenSourceCodeMenuCommand >> activationStrategy [
	^SycSourceCodeMenuActivation
]

{ #category : 'context menu' }
SycOpenSourceCodeMenuCommand >> addCommandsTo: aCmdMenu [

	(ClyCommandGroupBuilder buildSortedForAll: self cmCommandClasses context: context) commands do: [ :command | aCmdMenu rootGroup addItem: (ClyCommandMenuItem on: command inContext: context) ]
]

{ #category : 'context menu' }
SycOpenSourceCodeMenuCommand >> cmCommandClass [

	^ SycSourceCodeCmCommand
]

{ #category : 'context menu' }
SycOpenSourceCodeMenuCommand >> cmCommandClasses [

	^ {
		  SycSourceCodeCmCommand.
		  SycVariableCmCommand }
]

{ #category : 'context menu' }
SycOpenSourceCodeMenuCommand >> createContextMenu [

	| menu |
	menu := CmdMenu activatedBy: self activationStrategy.
	self activationStrategy visibleInstancesInContext: context do: [ :activationStrategy | menu buildCommandItemInContext: context activatingBy: activationStrategy ].
	self addCommandsTo: menu.
	^ menu buildContextMenuFor: context tool
]

{ #category : 'accessing' }
SycOpenSourceCodeMenuCommand >> defaultMenuIconName [
	^#smallAuthoringTools
]

{ #category : 'accessing' }
SycOpenSourceCodeMenuCommand >> defaultMenuItemName [
	^'Source code'
]

{ #category : 'accessing' }
SycOpenSourceCodeMenuCommand >> description [

	^ 'Opens special source code menu.'
]

{ #category : 'execution' }
SycOpenSourceCodeMenuCommand >> execute [

	context selectedTextInterval ifEmpty: [
		context showSourceNode].

	super execute
]

{ #category : 'context menu' }
SycOpenSourceCodeMenuCommand >> registerContextMenuItemsFor: aCommandItem withBuilder: aBuilder [

	| submenu |
	RecursionStopper during: [
		submenu := self activationStrategy buildMenuInContext: context.
		submenu isActive ifTrue: [
			self doRegisterContextMenuItemsFor: aCommandItem withBuilder: aBuilder.
			self addCommandsTo: submenu.
			submenu rootGroup name: aCommandItem name.
			submenu registerContextMenuItemsWithBuilder: aBuilder ] ]
]
