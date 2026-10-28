"
I am a Commander2 hybrid for the method group (protocol) commands that show in the full browser protocol pane. I sit under the v1 ClyMethodGroupCommand and keep its legacy lifecycle for the shortcuts, while menus run my subclasses through the Commander2 contract. I am removed together with Commander v1.
"
Class {
	#name : 'ClyMethodGroupMenuCmCommand',
	#superclass : 'ClyMethodGroupCommand',
	#traits : 'TCommanderMigrationHybridCommand',
	#classTraits : 'TCommanderMigrationHybridCommand classTrait',
	#category : 'Calypso-SystemTools-FullBrowser',
	#package : 'Calypso-SystemTools-FullBrowser'
}

{ #category : 'execution' }
ClyMethodGroupMenuCmCommand >> executeComplexRefactoring [

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
ClyMethodGroupMenuCmCommand >> initialize [

	super initialize.
	prepared := false
]

{ #category : 'execution' }
ClyMethodGroupMenuCmCommand >> prepareFullExecution [

	methodGroups := self context selectedMethodGroups
]
