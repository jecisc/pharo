"
I am a command to push down given variables
"
Class {
	#name : 'SycPushDownVariableCommand',
	#superclass : 'SycVariableCmCommand',
	#category : 'SystemCommands-VariableCommands',
	#package : 'SystemCommands-VariableCommands'
}

{ #category : 'accessing' }
SycPushDownVariableCommand >> defaultMenuIconName [
	^ #down
]

{ #category : 'accessing' }
SycPushDownVariableCommand >> defaultMenuItemName [
	^'Push down'
]

{ #category : 'execution' }
SycPushDownVariableCommand >> executeRefactorings [

	^ ((RePushDownInstanceVariableDriver newApplication: self application)
		scopes: refactoringScopes;
		variables: variables) runRefactoring
]

{ #category : 'accessing' }
SycPushDownVariableCommand >> order [

	^ 1.4
]

{ #category : 'execution' }
SycPushDownVariableCommand >> prepareFullExecution [

	super prepareFullExecution.
	(variables allSatisfy: [ :selectedVar | selectedVar definingClass hasSubclasses ]) ifTrue: [ ^ self ].
	self inform: 'One of the selected variables belongs to a class that has no subclasses to push down the selection(s)'.
	CmdCommandAborted signal
]

{ #category : 'execution' }
SycPushDownVariableCommand >> prepareFullExecutionInContext: aToolContext [

	super prepareFullExecutionInContext: aToolContext.
	self prepareFullExecution
]
