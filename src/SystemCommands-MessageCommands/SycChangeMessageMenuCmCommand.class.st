"
I am a Commander2 hybrid for the rename and deprecate message commands, which show in the method item menu and in the source code menu. I sit under the v1 SycChangeMessageSignatureCommand, so the Refactorings submenu (SycMessageCmCommand) does not receive them. I am removed together with Commander v1.
"
Class {
	#name : 'SycChangeMessageMenuCmCommand',
	#superclass : 'SycChangeMessageSignatureCommand',
	#traits : 'TCommanderMigrationHybridCommand',
	#classTraits : 'TCommanderMigrationHybridCommand classTrait',
	#category : 'SystemCommands-MessageCommands',
	#package : 'SystemCommands-MessageCommands'
}

{ #category : 'execution' }
SycChangeMessageMenuCmCommand >> executeComplexRefactoring [

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

{ #category : 'initialization' }
SycChangeMessageMenuCmCommand >> initialize [

	super initialize.
	prepared := false
]

{ #category : 'preparation' }
SycChangeMessageMenuCmCommand >> prepareFullExecution [

	self setUpModelFromContext: self context.
	refactoredClass := self context lastSelectedMessage methodClass.
	refactoringScopes := self context refactoringScopes.
	originalMessage := self context lastSelectedMessage
]
