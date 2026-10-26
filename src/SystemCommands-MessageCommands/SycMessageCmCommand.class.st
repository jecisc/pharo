"
I am a temporary Commander2 bridge for message/signature commands. I subclass the legacy message command to keep its dialogs and refactoring behavior, and add the Commander2 execution lifecycle on top. I will be removed when Commander v1 is gone.
"
Class {
	#name : 'SycMessageCmCommand',
	#superclass : 'SycChangeMessageSignatureCommand',
	#instVars : [
		'prepared',
		'context'
	],
	#category : 'SystemCommands-MessageCommands',
	#package : 'SystemCommands-MessageCommands'
}

{ #category : 'testing' }
SycMessageCmCommand >> acceptVisitor: aVisitor [

	^ aVisitor visitCommand: self
]

{ #category : 'execution' }
SycMessageCmCommand >> applyCommandResult [

	self applyResultInContext: self context
]

{ #category : 'testing' }
SycMessageCmCommand >> canBeExecuted [

	^ self class canBeExecutedInContext: self context
]

{ #category : 'accessing' }
SycMessageCmCommand >> context [

	^ context
]

{ #category : 'accessing' }
SycMessageCmCommand >> context: aToolContext [

	context := aToolContext
]

{ #category : 'execution' }
SycMessageCmCommand >> execute [

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
SycMessageCmCommand >> executeRefactoring [

	^ self executeRefactorings
]

{ #category : 'initialization' }
SycMessageCmCommand >> initialize [

	super initialize.
	prepared := false
]

{ #category : 'testing' }
SycMessageCmCommand >> isCommand [

	^ true
]

{ #category : 'testing' }
SycMessageCmCommand >> isGroup [

	^ false
]

{ #category : 'accessing' }
SycMessageCmCommand >> orderInContext: aToolContext [

	^ aToolContext class = ClyMethodSourceCodeContext
		  ifTrue: [ 1.3 ]
		  ifFalse: [ self order ]
]

{ #category : 'preparation' }
SycMessageCmCommand >> prepareFullExecution [

	self setUpModelFromContext: self context.
	refactoredClass := self context lastSelectedMessage methodClass.
	refactoringScopes := self context refactoringScopes.
	originalMessage := self context lastSelectedMessage
]

{ #category : 'preparation' }
SycMessageCmCommand >> prepareFullExecutionInContext: aToolContext [

	self context: aToolContext.
	super prepareFullExecutionInContext: aToolContext.
	prepared := true
]

{ #category : 'execution' }
SycMessageCmCommand >> processCommandFailure: anException [

	context processFailure: anException of: self
]
