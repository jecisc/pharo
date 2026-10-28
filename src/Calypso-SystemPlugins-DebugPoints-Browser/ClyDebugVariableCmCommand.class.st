"
I am a Commander2 hybrid for the debug point commands applied to the variables of the full browser. I sit under the v1 ClyDebugVariableCommand and keep its legacy lifecycle for the shortcuts, while menus run my subclasses through the Commander2 contract. I am removed together with Commander v1.
"
Class {
	#name : 'ClyDebugVariableCmCommand',
	#superclass : 'ClyDebugVariableCommand',
	#traits : 'TCommanderMigrationHybridCommand',
	#classTraits : 'TCommanderMigrationHybridCommand classTrait',
	#category : 'Calypso-SystemPlugins-DebugPoints-Browser',
	#package : 'Calypso-SystemPlugins-DebugPoints-Browser'
}

{ #category : 'testing' }
ClyDebugVariableCmCommand class >> isAbstract [

	^ self subclasses isEmpty not
]

{ #category : 'execution' }
ClyDebugVariableCmCommand >> executeComplexRefactoring [

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
ClyDebugVariableCmCommand >> initialize [

	super initialize.
	prepared := false
]

{ #category : 'execution' }
ClyDebugVariableCmCommand >> prepareFullExecution [

	variables := self context selectedVariables
]

{ #category : 'execution' }
ClyDebugVariableCmCommand >> prepareFullExecutionInContext: aToolContext [

	self context: aToolContext.
	self prepareFullExecution.
	prepared := true
]
