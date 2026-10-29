"
I am a Commander2 hybrid for the rename and deprecate message commands, which show in the method item menu and in the source code menu. I sit under the v1 SycChangeMessageSignatureCommand, so the Refactorings submenu (SycMessageCmCommand) does not receive them. I am removed together with Commander v1.
"
Class {
	#name : 'SycChangeMessageMenuCmCommand',
	#superclass : 'SycChangeMessageSignatureCommand',
	#category : 'SystemCommands-MessageCommands',
	#package : 'SystemCommands-MessageCommands'
}

{ #category : 'execution' }
SycChangeMessageMenuCmCommand >> execute [

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

{ #category : 'preparation' }
SycChangeMessageMenuCmCommand >> prepareFullExecution [

	self setUpModelFromContext: self context.
	refactoredClass := self context lastSelectedMessage methodClass.
	refactoringScopes := self context refactoringScopes.
	originalMessage := self context lastSelectedMessage
]
