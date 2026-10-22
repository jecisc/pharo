"
I am a command to open special method menu.
I show in menu all commands annotated by SycMethodMenuActivation
"
Class {
	#name : 'SycOpenMethodMenuCommand',
	#superclass : 'SycOpenContextMenuCommand',
	#category : 'SystemCommands-MethodCommands',
	#package : 'SystemCommands-MethodCommands'
}

{ #category : 'execution' }
SycOpenMethodMenuCommand >> activationStrategy [
	^ SycMethodMenuActivation
]

{ #category : 'menu' }
SycOpenMethodMenuCommand >> addClyCommandsToMenu: aMenuMorph [

	| group groupMenu |
	self activationStrategy = SycMethodMenuActivation ifFalse: [ ^ aMenuMorph ].
	group := ClyCommandGroupBuilder buildSortedFor: self cmCommandClass context: self context.
	groupMenu := MenuMorph new.
	ClyCommandGroupMenuRenderer render: group on: groupMenu.
	groupMenu items reverseDo: [ :each | aMenuMorph addMorphFront: each ].
	^ aMenuMorph
]

{ #category : 'context menu' }
SycOpenMethodMenuCommand >> cmCommandClass [
	^ SycMethodCmCommand
]

{ #category : 'accessing' }
SycOpenMethodMenuCommand >> defaultMenuItemName [
	^'Refactorings'
]

{ #category : 'accessing' }
SycOpenMethodMenuCommand >> description [

	^ 'Opens special method menu.'
]
