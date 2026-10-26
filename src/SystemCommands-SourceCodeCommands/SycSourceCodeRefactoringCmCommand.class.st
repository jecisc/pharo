Class {
	#name : 'SycSourceCodeRefactoringCmCommand',
	#superclass : 'SycSourceCodeRefactoringCommand',
	#instVars : [
		'prepared',
		'context'
	],
	#category : 'SystemCommands-SourceCodeCommands',
	#package : 'SystemCommands-SourceCodeCommands'
}

{ #category : 'testing' }
SycSourceCodeRefactoringCmCommand >> acceptVisitor: aVisitor [

	^ aVisitor visitCommand: self
]

{ #category : 'execution' }
SycSourceCodeRefactoringCmCommand >> applyCommandResult [

	self applyResultInContext: self context
]

{ #category : 'testing' }
SycSourceCodeRefactoringCmCommand >> canBeExecuted [

	^ self class canBeExecutedInContext: self context
]

{ #category : 'accessing' }
SycSourceCodeRefactoringCmCommand >> context [

	^ context
]

{ #category : 'accessing' }
SycSourceCodeRefactoringCmCommand >> context: aToolContext [

	context := aToolContext
]

{ #category : 'execution' }
SycSourceCodeRefactoringCmCommand >> execute [

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
SycSourceCodeRefactoringCmCommand >> executeRefactoring [

	^ self executeRefactorings
]

{ #category : 'execution' }
SycSourceCodeRefactoringCmCommand >> executeRefactorings [

	^ self executeRefactoring: self asRefactorings
]

{ #category : 'accessing' }
SycSourceCodeRefactoringCmCommand >> icon [

	^ self defaultMenuIcon
]

{ #category : 'initialization' }
SycSourceCodeRefactoringCmCommand >> initialize [

	super initialize.
	prepared := false
]

{ #category : 'testing' }
SycSourceCodeRefactoringCmCommand >> isCommand [

	^ true
]

{ #category : 'testing' }
SycSourceCodeRefactoringCmCommand >> isGroup [

	^ false
]

{ #category : 'accessing' }
SycSourceCodeRefactoringCmCommand >> name [

	^ self defaultMenuItemName
]

{ #category : 'accessing' }
SycSourceCodeRefactoringCmCommand >> orderInContext: aToolContext [

	^ self order
]

{ #category : 'execution' }
SycSourceCodeRefactoringCmCommand >> prepareFullExecution [

	method := self context lastSelectedMethod.
	sourceNode := self context lastSelectedSourceNode.
	refactoringScopes := self context refactoringScopes
]

{ #category : 'execution' }
SycSourceCodeRefactoringCmCommand >> prepareFullExecutionInContext: aToolContext [

	self context: aToolContext.
	super prepareFullExecutionInContext: aToolContext.
	prepared := true
]

{ #category : 'execution' }
SycSourceCodeRefactoringCmCommand >> processCommandFailure: anException [

	context processFailure: anException of: self
]
