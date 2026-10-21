Class {
	#name : 'SycOpenScopesInClassMenuCommand',
	#superclass : 'SycOpenContextMenuCommand',
	#category : 'SystemCommands-ClassCommands-Scope',
	#package : 'SystemCommands-ClassCommands',
	#tag : 'Scope'
}

{ #category : 'activation' }
SycOpenScopesInClassMenuCommand class >> browserContextMenuActivation [
	<classAnnotation>

	^ CmdContextMenuActivation byRootGroupItemOrder: 1.5 for: ClyClass asCalypsoItemContext
]

{ #category : 'execution' }
SycOpenScopesInClassMenuCommand >> activationStrategy [
	^ SycScopesMenuActivation
]

{ #category : 'execution' }
SycOpenScopesInClassMenuCommand >> addClyCommandsToMenu: aMenuMorph [

	| group |
	group := ClyCommandGroupBuilder
		         buildFor: self cmCommandClass
		         context: self context.
	^ ClyCommandGroupMenuRenderer
		  render: group
		  on: aMenuMorph
]

{ #category : 'context menu' }
SycOpenScopesInClassMenuCommand >> cmCommandClass [
	^ SycScopesCmCommand
]

{ #category : 'accessing' }
SycOpenScopesInClassMenuCommand >> defaultMenuIconName [
	^ #smallPushpin
]

{ #category : 'accessing' }
SycOpenScopesInClassMenuCommand >> defaultMenuItemName [
	^'Scopes'
]
