"
Remove Class Refactoring: Safely delete a selected class, ensuring no references are left behind, and preview changes before applying.
"
Class {
	#name : 'SycRemoveClassCommand',
	#superclass : 'SycClassMenuCmCommand',
	#category : 'SystemCommands-ClassCommands',
	#package : 'SystemCommands-ClassCommands'
}

{ #category : 'accessing' }
SycRemoveClassCommand >> defaultMenuIconName [
	^#remove
]

{ #category : 'accessing' }
SycRemoveClassCommand >> defaultMenuItemName [
	^'(R) Remove'
]

{ #category : 'execution' }
SycRemoveClassCommand >> executeRefactorings [

	^ ((ReRemoveClassDriver newApplication: self application) scopes: self context refactoringScopes classes: classes) runRefactoring
]

{ #category : 'testing' }
SycRemoveClassCommand >> isAvailableInMenuOf: aToolContext [

	^ aToolContext isFullBrowserClassContext
]

{ #category : 'accessing' }
SycRemoveClassCommand >> order [

	^ 10000
]
