Class {
	#name : 'SycVariableCmCommand',
	#superclass : 'SycRefactorVariableCommand',
	#instVars : [
		'prepared',
		'context'
	],
	#category : 'SystemCommands-VariableCommands',
	#package : 'SystemCommands-VariableCommands'
}

{ #category : 'testing' }
SycVariableCmCommand >> acceptVisitor: aVisitor [

	^ aVisitor visitCommand: self
]

{ #category : 'execution' }
SycVariableCmCommand >> applyCommandResult [

	self applyResultInContext: self context
]

{ #category : 'testing' }
SycVariableCmCommand >> canBeExecuted [

	^ self class canBeExecutedInContext: self context
]

{ #category : 'accessing' }
SycVariableCmCommand >> context [

	^ context
]

{ #category : 'accessing' }
SycVariableCmCommand >> context: aToolContext [

	context := aToolContext
]

{ #category : 'execution' }
SycVariableCmCommand >> execute [

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
SycVariableCmCommand >> executeRefactoring [

	^ self executeRefactorings
]

{ #category : 'accessing' }
SycVariableCmCommand >> fullBrowserOrder [

	^ self order
]

{ #category : 'initialization' }
SycVariableCmCommand >> initialize [

	super initialize.
	prepared := false
]

{ #category : 'testing' }
SycVariableCmCommand >> isCommand [

	^ true
]

{ #category : 'testing' }
SycVariableCmCommand >> isGroup [

	^ false
]

{ #category : 'accessing' }
SycVariableCmCommand >> orderInContext: aToolContext [

	^ aToolContext class = ClyFullBrowserVariableContext
		  ifTrue: [ self fullBrowserOrder ]
		  ifFalse: [ self order ]
]

{ #category : 'execution' }
SycVariableCmCommand >> prepareFullExecution [

	variables := self context selectedVariables.
	toolContext := self context.
	refactoringScopes := self context refactoringScopes
]

{ #category : 'execution' }
SycVariableCmCommand >> prepareFullExecutionInContext: aToolContext [

	self context: aToolContext.
	super prepareFullExecutionInContext: aToolContext.
	prepared := true
]

{ #category : 'execution' }
SycVariableCmCommand >> processCommandFailure: anException [

	context processFailure: anException of: self
]
