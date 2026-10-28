"
I am a Commander2 hybrid for the variable navigation commands (references, writers, inspect value, browse). I sit directly under the v1 SycVariableCommand, so unlike the refactoring hybrid I accept global variables. My menu group is the Query group. I am removed together with Commander v1.
"
Class {
	#name : 'SycVariableNavigationCmCommand',
	#superclass : 'SycVariableCommand',
	#traits : 'TCommanderMigrationHybridCommand',
	#classTraits : 'TCommanderMigrationHybridCommand classTrait',
	#category : 'SystemCommands-VariableCommands',
	#package : 'SystemCommands-VariableCommands'
}

{ #category : 'execution' }
SycVariableNavigationCmCommand >> executeComplexRefactoring [

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
SycVariableNavigationCmCommand >> initialize [

	super initialize.
	prepared := false
]

{ #category : 'accessing' }
SycVariableNavigationCmCommand >> menuGroup [

	^ ClyQueryMenuGroup
]

{ #category : 'accessing' }
SycVariableNavigationCmCommand >> orderInContext: aToolContext [

	^ aToolContext isFullBrowserVariableContext
		ifTrue: [ self fullBrowserOrder ]
		ifFalse: [ self order ]
]

{ #category : 'preparation' }
SycVariableNavigationCmCommand >> prepareFullExecution [

	variables := self context selectedVariables.
	toolContext := self context
]
