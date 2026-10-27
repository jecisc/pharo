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

	^ (self class canBeExecutedInContext: self context)
		and: [ self isAvailableInMenuOf: self context ]
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
TCommanderMigrationHybridCommand >> executeComplexRefactoring [

	"Same preview as the v1 path: apply the picked changes on OK, nothing on cancel."
	| submitDialog |
	submitDialog := SycRefactoringPreviewPresenter for: self scopes: self context refactoringScopes.
	submitDialog existChanges
		ifTrue: [
			submitDialog openDialog
				okAction: [
					submitDialog accept.
					self applyCommandResult ];
				cancelAction: [ :p | p beCancel ] ]
		ifFalse: [ submitDialog alert: 'There is no change produced by this refactoring' ].
	CmdCommandAborted signal
]

{ #category : 'execution' }
TCommanderMigrationHybridCommand >> executeRefactoring [

	^ self executeRefactorings
]

{ #category : 'accessing' }
TCommanderMigrationHybridCommand >> fullBrowserOrder [

	^ self order
]

{ #category : 'accessing' }
TCommanderMigrationHybridCommand >> icon [

	^ self defaultMenuIcon
]

{ #category : 'testing' }
TCommanderMigrationHybridCommand >> isAvailableInMenuOf: aToolContext [

	^ true
]

{ #category : 'testing' }
TCommanderMigrationHybridCommand >> isCommand [

	^ true
]

{ #category : 'testing' }
TCommanderMigrationHybridCommand >> isGroup [

	^ false
]

{ #category : 'accessing' }
TCommanderMigrationHybridCommand >> menuGroup [

	^ CmdRootMenuGroup
]

{ #category : 'accessing' }
TCommanderMigrationHybridCommand >> name [

	^ self defaultMenuItemName
]

{ #category : 'accessing' }
TCommanderMigrationHybridCommand >> orderInContext: aToolContext [

	^ self order
]

{ #category : 'execution' }
TCommanderMigrationHybridCommand >> processCommandFailure: anException [

	context processFailure: anException of: self
]
