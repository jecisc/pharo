"
I am a Commander2 hybrid for the browser level commands that show in the browser menus (find, browse, create class, scope and test commands). I sit under the v1 ClyBrowserCommand and keep its legacy lifecycle for the shortcuts, while menus run my subclasses through the Commander2 contract. I am removed together with Commander v1.
"
Class {
	#name : 'ClyBrowserMenuCmCommand',
	#superclass : 'ClyBrowserCommand',
	#traits : 'TCommanderMigrationHybridCommand',
	#classTraits : 'TCommanderMigrationHybridCommand classTrait',
	#category : 'Calypso-SystemTools-FullBrowser',
	#package : 'Calypso-SystemTools-FullBrowser'
}

{ #category : 'execution' }
ClyBrowserMenuCmCommand >> executeComplexRefactoring [

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
ClyBrowserMenuCmCommand >> initialize [

	super initialize.
	prepared := false
]

{ #category : 'execution' }
ClyBrowserMenuCmCommand >> prepareFullExecution [

	browser := self context browser
]
