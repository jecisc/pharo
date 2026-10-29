Class {
	#name : 'SycSourceCodeRefactoringCommand',
	#superclass : 'SycSourceCodeCommand',
	#traits : 'TRefactoringCommandSupport',
	#classTraits : 'TRefactoringCommandSupport classTrait',
	#instVars : [
		'refactoringScopes'
	],
	#category : 'SystemCommands-SourceCodeCommands',
	#package : 'SystemCommands-SourceCodeCommands'
}

{ #category : 'converting' }
SycSourceCodeRefactoringCommand >> asRefactorings [
	self subclassResponsibility
]

{ #category : 'private' }
SycSourceCodeRefactoringCommand >> executeRefactoring: refactoring [

	[ refactoring first execute ]
		on: RBRefactoringError
		do: [ :e | self morphicUIManager alert: e messageText ]
]

{ #category : 'execution' }
SycSourceCodeRefactoringCommand >> executeRefactorings [

	^ self executeRefactoring: self asRefactorings
]

{ #category : 'accessing' }
SycSourceCodeRefactoringCommand >> orderInContext: aToolContext [

	^ self order
]

{ #category : 'execution' }
SycSourceCodeRefactoringCommand >> prepareFullExecution [

	refactoringScopes := self context refactoringScopes
]
