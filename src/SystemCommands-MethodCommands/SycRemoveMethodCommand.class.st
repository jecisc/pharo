Class {
	#name : 'SycRemoveMethodCommand',
	#superclass : 'SycMethodMenuCmCommand',
	#category : 'SystemCommands-MethodCommands',
	#package : 'SystemCommands-MethodCommands'
}

{ #category : 'activation' }
SycRemoveMethodCommand class >> methodShortcutActivation [
	<classAnnotation>

	^CmdShortcutActivation removalFor: ClyMethod asCalypsoItemContext
]

{ #category : 'accessing' }
SycRemoveMethodCommand >> defaultMenuIconName [
	^#remove
]

{ #category : 'accessing' }
SycRemoveMethodCommand >> defaultMenuItemName [
	^'(R) Remove'
]

{ #category : 'accessing' }
SycRemoveMethodCommand >> description [

	^ 'Removes methods.'
]

{ #category : 'execution' }
SycRemoveMethodCommand >> executeRefactorings [

	(ReRemoveMethodDriver new scopes: self context refactoringScopes methods: methods) runRefactoring
]

{ #category : 'accessing' }
SycRemoveMethodCommand >> order [

	^ 10000
]
