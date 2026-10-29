"
I am a Commander2 hybrid for the source code refactorings (inline, extract, convert temp, rename temp, move temp definition, run test). I sit under the v1 SycSourceCodeRefactoringCommand and keep its legacy lifecycle for the shortcuts, while the Source code menu runs my subclasses through the Commander2 contract. Subclasses define executeRefactorings and order. I am removed together with Commander v1.
"
Class {
	#name : 'SycSourceCodeRefactoringCmCommand',
	#superclass : 'SycSourceCodeRefactoringCommand',
	#category : 'SystemCommands-SourceCodeCommands',
	#package : 'SystemCommands-SourceCodeCommands'
}

{ #category : 'execution' }
SycSourceCodeRefactoringCmCommand >> execute [

	(prepared or: [ self context isNil ])
		ifTrue: [ self executeRefactorings ]
		ifFalse: [
				[
					prepared := true.
					self prepareFullExecution.
					self isComplexRefactoring
						ifTrue: [ self executeComplexRefactoring ]
						ifFalse: [
								self executeRefactoring.
								self applyCommandResult ] ]
					on: Exception
					do: [ :exception | self processCommandFailure: exception ] ]
]

{ #category : 'execution' }
SycSourceCodeRefactoringCmCommand >> executeRefactorings [

	^ self executeRefactoring: self asRefactorings
]

{ #category : 'accessing' }
SycSourceCodeRefactoringCmCommand >> orderInContext: aToolContext [

	^ self order
]

{ #category : 'execution' }
SycSourceCodeRefactoringCmCommand >> prepareFullExecution [

	refactoringScopes := self context refactoringScopes
]
