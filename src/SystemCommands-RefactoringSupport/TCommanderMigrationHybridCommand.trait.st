"
I hold the Commander2 lifecycle shared by the temporary hybrid commands that sit under Commander v1 bases (variables, messages, source code refactorings, method editor, variable navigation). I own the prepared flag and the tool context, and I run the refactoring through execute. Hybrids keep their own initialize and prepareFullExecutionInContext:, because those send super to the v1 base. I am removed together with Commander v1.
"
Trait {
	#name : 'TCommanderMigrationHybridCommand',
	#instVars : [
		'prepared',
		'context'
	],
	#category : 'SystemCommands-RefactoringSupport',
	#package : 'SystemCommands-RefactoringSupport'
}

{ #category : 'testing' }
TCommanderMigrationHybridCommand >> acceptVisitor: aVisitor [

	^ aVisitor visitCommand: self
]

{ #category : 'execution' }
TCommanderMigrationHybridCommand >> applyCommandResult [

	self applyResultInContext: self context
]

{ #category : 'testing' }
TCommanderMigrationHybridCommand >> canBeExecuted [

	^ self class canBeExecutedInContext: self context
]

{ #category : 'accessing' }
TCommanderMigrationHybridCommand >> context [

	^ context
]

{ #category : 'accessing' }
TCommanderMigrationHybridCommand >> context: aToolContext [

	context := aToolContext
]

{ #category : 'execution' }
TCommanderMigrationHybridCommand >> execute [

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
TCommanderMigrationHybridCommand >> executeRefactoring [

	^ self executeRefactorings
]

{ #category : 'testing' }
TCommanderMigrationHybridCommand >> isCommand [

	^ true
]

{ #category : 'testing' }
TCommanderMigrationHybridCommand >> isGroup [

	^ false
]

{ #category : 'execution' }
TCommanderMigrationHybridCommand >> processCommandFailure: anException [

	context processFailure: anException of: self
]
