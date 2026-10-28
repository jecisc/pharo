"
I am a Commander2 hybrid for the commands that run tests from the browsers. I sit under the v1 ClyTestCommand and keep its legacy lifecycle for the table icons and shortcuts, while menus run my subclasses through the Commander2 contract. I am removed together with Commander v1.
"
Class {
	#name : 'ClyTestCmCommand',
	#superclass : 'ClyTestCommand',
	#traits : 'TCommanderMigrationHybridCommand',
	#classTraits : 'TCommanderMigrationHybridCommand classTrait',
	#category : 'Calypso-SystemPlugins-SUnit-Browser',
	#package : 'Calypso-SystemPlugins-SUnit-Browser'
}

{ #category : 'testing' }
ClyTestCmCommand class >> isAbstract [

	^ self subclasses isEmpty not
]

{ #category : 'execution' }
ClyTestCmCommand >> executeComplexRefactoring [

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
ClyTestCmCommand >> initialize [

	super initialize.
	prepared := false
]
