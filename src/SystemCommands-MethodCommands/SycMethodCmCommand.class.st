"
This class is an extension so we can mix command of Commander2 with Commander.
"
Class {
	#name : 'SycMethodCmCommand',
	#superclass : 'SycCmCommand',
	#category : 'SystemCommands-MethodCommands',
	#package : 'SystemCommands-MethodCommands'
}

{ #category : 'adding' }
SycMethodCmCommand class >> activationStrategy [
	^ SycMethodMenuActivation
]

{ #category : 'testing' }
SycMethodCmCommand class >> canBeExecutedInContext: aToolContext [
	^ (self new
		context: aToolContext;
		yourself) canBeExecuted
]

{ #category : 'accessing' }
SycMethodCmCommand >> application [
	^ StPharoApplication current
]

{ #category : 'execution' }
SycMethodCmCommand >> applyResultInContext: aToolContext [
]

{ #category : 'testing' }
SycMethodCmCommand >> canBeExecuted [
	^ self methods isNotEmpty
]

{ #category : 'execution' }
SycMethodCmCommand >> executeRefactoring [
	^ self executeRefactorings
]

{ #category : 'testing' }
SycMethodCmCommand >> isComplexRefactoring [
	^ false
]

{ #category : 'accessing' }
SycMethodCmCommand >> methods [
	^ self hasContext
		ifTrue: [ self context selectedMethods ]
		ifFalse: [ #() ]
]

{ #category : 'preparation' }
SycMethodCmCommand >> prepareFullExecution [
	super prepareFullExecution.
	model ifNil: [ self setUpModelFromContext: self context ]
]

{ #category : 'preparation' }
SycMethodCmCommand >> prepareFullExecutionInContext: aToolContext [
	self context: aToolContext.
	self prepareFullExecution
]

{ #category : 'preparation' }
SycMethodCmCommand >> readParametersFromContext: aToolContext [
	self context: aToolContext
]

{ #category : 'accessing' }
SycMethodCmCommand >> refactoringScopes [
	^ self hasContext
		ifTrue: [ self context refactoringScopes ]
		ifFalse: [ #() ]
]
