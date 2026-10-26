Class {
	#name : 'ClyMethodEditorCmCommand',
	#superclass : 'ClyMethodEditorCommand',
	#instVars : [
		'prepared',
		'context'
	],
	#category : 'Calypso-SystemTools-Core',
	#package : 'Calypso-SystemTools-Core'
}

{ #category : 'testing' }
ClyMethodEditorCmCommand >> acceptVisitor: aVisitor [

	^ aVisitor visitCommand: self
]

{ #category : 'execution' }
ClyMethodEditorCmCommand >> applyCommandResult [

	self applyResultInContext: self context
]

{ #category : 'testing' }
ClyMethodEditorCmCommand >> canBeExecuted [

	^ self class canBeExecutedInContext: self context
]

{ #category : 'accessing' }
ClyMethodEditorCmCommand >> context [

	^ context
]

{ #category : 'accessing' }
ClyMethodEditorCmCommand >> context: aToolContext [

	context := aToolContext
]

{ #category : 'execution' }
ClyMethodEditorCmCommand >> execute [

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
ClyMethodEditorCmCommand >> executeRefactoring [

	^ self executeRefactorings
]

{ #category : 'accessing' }
ClyMethodEditorCmCommand >> icon [

	^ self defaultMenuIcon
]

{ #category : 'initialization' }
ClyMethodEditorCmCommand >> initialize [

	super initialize.
	prepared := false
]

{ #category : 'testing' }
ClyMethodEditorCmCommand >> isCommand [

	^ true
]

{ #category : 'testing' }
ClyMethodEditorCmCommand >> isGroup [

	^ false
]

{ #category : 'accessing' }
ClyMethodEditorCmCommand >> name [

	^ self defaultMenuItemName
]

{ #category : 'accessing' }
ClyMethodEditorCmCommand >> orderInContext: aToolContext [

	^ self order
]

{ #category : 'preparation' }
ClyMethodEditorCmCommand >> prepareFullExecution [

	methodEditor := self context tool
]

{ #category : 'preparation' }
ClyMethodEditorCmCommand >> prepareFullExecutionInContext: aToolContext [

	self context: aToolContext.
	super prepareFullExecutionInContext: aToolContext.
	prepared := true
]

{ #category : 'execution' }
ClyMethodEditorCmCommand >> processCommandFailure: anException [

	context processFailure: anException of: self
]
