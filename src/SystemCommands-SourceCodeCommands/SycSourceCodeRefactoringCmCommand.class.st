"
I am a Commander2 hybrid for the source code refactorings (inline, extract, convert temp, rename temp, move temp definition, run test). I sit under the v1 SycSourceCodeRefactoringCommand and keep its legacy lifecycle for the shortcuts, while the Source code menu runs my subclasses through the Commander2 contract. Subclasses define executeRefactorings and order. I am removed together with Commander v1.
"
Class {
	#name : 'SycSourceCodeRefactoringCmCommand',
	#superclass : 'SycSourceCodeRefactoringCommand',
	#traits : 'TCommanderMigrationHybridCommand',
	#classTraits : 'TCommanderMigrationHybridCommand classTrait',
	#category : 'SystemCommands-SourceCodeCommands',
	#package : 'SystemCommands-SourceCodeCommands'
}

{ #category : 'execution' }
SycSourceCodeRefactoringCmCommand >> executeComplexRefactoring [

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
	CmCommandAborted signal
]

{ #category : 'execution' }
SycSourceCodeRefactoringCmCommand >> executeRefactorings [

	^ self executeRefactoring: self asRefactorings
]

{ #category : 'initialization' }
SycSourceCodeRefactoringCmCommand >> initialize [

	super initialize.
	prepared := false
]

{ #category : 'accessing' }
SycSourceCodeRefactoringCmCommand >> orderInContext: aToolContext [

	^ self order
]

{ #category : 'execution' }
SycSourceCodeRefactoringCmCommand >> prepareFullExecution [

	refactoringScopes := self context refactoringScopes
]
