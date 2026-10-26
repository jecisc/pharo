"
I am a command to protect given variables
"
Class {
	#name : 'SycProtectVariableCommand',
	#superclass : 'SycVariableCmCommand',
	#instVars : [
		'selectedClass'
	],
	#category : 'SystemCommands-VariableCommands',
	#package : 'SystemCommands-VariableCommands'
}

{ #category : 'accessing' }
SycProtectVariableCommand >> defaultMenuIconName [
	^ #group
]

{ #category : 'accessing' }
SycProtectVariableCommand >> defaultMenuItemName [
	^'Protect'
]

{ #category : 'execution' }
SycProtectVariableCommand >> executeRefactorings [

	^ ((ReProtectInstanceVariableDriver newApplication: self application)
		scopes: refactoringScopes
		variable: variables first
		class: selectedClass) runRefactoring
]

{ #category : 'accessing' }
SycProtectVariableCommand >> order [

	^ 1.2
]

{ #category : 'execution' }
SycProtectVariableCommand >> prepareFullExecution [

	super prepareFullExecution.
	selectedClass := variables first definingClass
]

{ #category : 'execution' }
SycProtectVariableCommand >> prepareFullExecutionInContext: aToolContext [

	super prepareFullExecutionInContext: aToolContext.
	selectedClass := aToolContext selectedVariables first definingClass.
]
