"
Rename Class Refactoring: Change the name of a selected class, update all references, and preview changes before applying.

"
Class {
	#name : 'SycRenameClassCommand',
	#superclass : 'SycSingleClassMenuCmCommand',
	#instVars : [
		'toolContext'
	],
	#category : 'SystemCommands-ClassCommands',
	#package : 'SystemCommands-ClassCommands'
}

{ #category : 'accessing' }
SycRenameClassCommand >> defaultMenuIconName [
	^ #edit
]

{ #category : 'accessing' }
SycRenameClassCommand >> defaultMenuItemName [
	^'(Old refactor) rename class'
]

{ #category : 'execution' }
SycRenameClassCommand >> executeRefactorings [

	toolContext class = ClyFullBrowserClassContext
		ifTrue: [
			(ReRenameClassDriver rename: targetClass name)
				model: RBBrowserEnvironment new;
				scopes: toolContext refactoringScopes;
				runRefactoring ]
		ifFalse: [
			toolContext class = ClyClassDefinitionContext
				ifTrue: [
					(ReRenameClassDriver rename: toolContext selectedSourceNode value)
						model: RBBrowserEnvironment new;
						scopes: toolContext refactoringScopes;
						runRefactoring ]
				ifFalse: [ "we are in selection in a method "
					(ReRenameClassDriver rename:
							 toolContext selectedSourceNode value name)
						model: RBBrowserEnvironment new;
						scopes: toolContext refactoringScopes;
						runRefactoring ] ]
]

{ #category : 'accessing' }
SycRenameClassCommand >> order [

	^ 1.2
]

{ #category : 'preparation' }
SycRenameClassCommand >> prepareFullExecution [

	super prepareFullExecution.
	toolContext := self context
]

{ #category : 'execution' }
SycRenameClassCommand >> prepareFullExecutionInContext: aToolContext [
	
	super prepareFullExecutionInContext: aToolContext.
	toolContext := aToolContext

]
