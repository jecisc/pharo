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

{ #category : 'testing' }
SycSourceCodeRefactoringCommand class >> isAbstract [

	^ self == SycSourceCodeRefactoringCommand
]

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
