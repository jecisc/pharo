"
I am a Commander2 hybrid for the variable navigation commands (references, writers, inspect value, browse). I sit directly under the v1 SycVariableCommand, so unlike the refactoring hybrid I accept global variables. My menu group is the Query group. I am removed together with Commander v1.
"
Class {
	#name : 'SycVariableNavigationCmCommand',
	#superclass : 'SycVariableCommand',
	#instVars : [
		'prepared',
		'context'
	],
	#category : 'SystemCommands-VariableCommands',
	#package : 'SystemCommands-VariableCommands'
}

{ #category : 'testing' }
SycVariableNavigationCmCommand >> acceptVisitor: aVisitor [

	^ aVisitor visitCommand: self
]

{ #category : 'execution' }
SycVariableNavigationCmCommand >> applyCommandResult [

	self applyResultInContext: self context
]

{ #category : 'testing' }
SycVariableNavigationCmCommand >> canBeExecuted [

	^ self class canBeExecutedInContext: self context
]

{ #category : 'accessing' }
SycVariableNavigationCmCommand >> context [

	^ context
]

{ #category : 'accessing' }
SycVariableNavigationCmCommand >> context: aToolContext [

	context := aToolContext
]

{ #category : 'execution' }
SycVariableNavigationCmCommand >> execute [

	prepared
		ifTrue: [ self executeRefactorings ]
		ifFalse: [
			[
				prepared := true.
				self prepareFullExecution.
				self executeRefactoring.
				self applyCommandResult ]
				on: Exception
				do: [ :exception | self processCommandFailure: exception ] ]
]

{ #category : 'execution' }
SycVariableNavigationCmCommand >> executeRefactoring [

	^ self executeRefactorings
]

{ #category : 'accessing' }
SycVariableNavigationCmCommand >> fullBrowserOrder [

	^ self order
]

{ #category : 'accessing' }
SycVariableNavigationCmCommand >> icon [

	^ self defaultMenuIcon
]

{ #category : 'initialization' }
SycVariableNavigationCmCommand >> initialize [

	super initialize.
	prepared := false
]

{ #category : 'testing' }
SycVariableNavigationCmCommand >> isCommand [

	^ true
]

{ #category : 'testing' }
SycVariableNavigationCmCommand >> isGroup [

	^ false
]

{ #category : 'accessing' }
SycVariableNavigationCmCommand >> menuGroup [

	^ ClyQueryMenuGroup
]

{ #category : 'accessing' }
SycVariableNavigationCmCommand >> name [

	^ self defaultMenuItemName
]

{ #category : 'accessing' }
SycVariableNavigationCmCommand >> orderInContext: aToolContext [

	^ (aToolContext isKindOf: ClyFullBrowserVariableContext)
		ifTrue: [ self fullBrowserOrder ]
		ifFalse: [ self order ]
]

{ #category : 'preparation' }
SycVariableNavigationCmCommand >> prepareFullExecution [

	variables := self context selectedVariables.
	toolContext := self context
]

{ #category : 'preparation' }
SycVariableNavigationCmCommand >> prepareFullExecutionInContext: aToolContext [

	self context: aToolContext.
	super prepareFullExecutionInContext: aToolContext.
	prepared := true
]

{ #category : 'execution' }
SycVariableNavigationCmCommand >> processCommandFailure: anException [

	context processFailure: anException of: self
]
