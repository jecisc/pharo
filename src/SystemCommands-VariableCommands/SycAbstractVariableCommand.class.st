"
This command replaces direct accesses to a selected instance variable with calls to its getter and setter methods.

If the corresponding accessor methods do not exist, they will be generated automatically.
"
Class {
	#name : 'SycAbstractVariableCommand',
	#superclass : 'SycRefactorVariableCommand',
	#instVars : [
		'selectedClass'
	],
	#category : 'SystemCommands-VariableCommands',
	#package : 'SystemCommands-VariableCommands'
}

{ #category : 'accessing' }
SycAbstractVariableCommand >> defaultMenuIconName [
	^ #smallAdd
]

{ #category : 'accessing' }
SycAbstractVariableCommand >> defaultMenuItemName [

	^'Abstract accessors'
]

{ #category : 'accessing' }
SycAbstractVariableCommand >> description [
    ^ 'Replace direct accesses to an instance variable with calls to its getter or setter. Missing accessor methods will be generated automatically.'
]

{ #category : 'execution' }
SycAbstractVariableCommand >> executeRefactorings [

	^ ((ReAbstractInstanceVariableDriver newApplication: self application) scopes: refactoringScopes name: variables first name class: selectedClass name) runRefactoring
]

{ #category : 'testing' }
SycAbstractVariableCommand >> isAvailableInMenuOf: aToolContext [

	^ aToolContext isFullBrowserVariableContext
]

{ #category : 'accessing' }
SycAbstractVariableCommand >> order [

	^ 1000
]

{ #category : 'execution' }
SycAbstractVariableCommand >> prepareFullExecution [

	super prepareFullExecution.
	selectedClass := variables first definingClass
]
