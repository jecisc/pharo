"
I am a Commander2 hybrid for the method editor commands (classify method, select method package, unclassify method). I sit under the v1 ClyMethodEditorCommand and take the editor tool from the context in prepareFullExecution. I am removed together with Commander v1.
"
Class {
	#name : 'ClyMethodEditorCmCommand',
	#superclass : 'ClyMethodEditorCommand',
	#traits : 'TCommanderMigrationHybridCommand',
	#classTraits : 'TCommanderMigrationHybridCommand classTrait',
	#category : 'Calypso-SystemTools-Core',
	#package : 'Calypso-SystemTools-Core'
}

{ #category : 'execution' }
ClyMethodEditorCmCommand >> executeComplexRefactoring [

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
ClyMethodEditorCmCommand >> initialize [

	super initialize.
	prepared := false
]

{ #category : 'accessing' }
ClyMethodEditorCmCommand >> orderInContext: aToolContext [

	^ self order
]

{ #category : 'preparation' }
ClyMethodEditorCmCommand >> prepareFullExecution [

	methodEditor := self context tool
]

{ #category : 'execution' }
ClyMethodEditorCmCommand >> prepareFullExecutionInContext: aToolContext [

	self context: aToolContext.
	self prepareFullExecution.
	prepared := true
]
