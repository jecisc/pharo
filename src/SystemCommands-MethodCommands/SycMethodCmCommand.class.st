"
This class is an extension so we can mix command of Commander2 with Commander.
"
Class {
	#name : 'SycMethodCmCommand',
	#superclass : 'SycLegacyCmCommand',
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

{ #category : 'testing' }
SycMethodCmCommand >> canBeExecuted [
	^ self methods isNotEmpty
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

{ #category : 'accessing' }
SycMethodCmCommand >> refactoringScopes [
	^ self hasContext
		ifTrue: [ self context refactoringScopes ]
		ifFalse: [ #() ]
]
