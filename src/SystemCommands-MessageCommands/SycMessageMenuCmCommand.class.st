"
I am a Commander2 hybrid for the message commands that browse senders (hierarchical senders). I sit under the v1 SycMessageCommand and keep its legacy lifecycle for the shortcuts, while the menus run my subclasses through the Commander2 contract. I am removed together with Commander v1.
"
Class {
	#name : 'SycMessageMenuCmCommand',
	#superclass : 'SycMessageCommand',
	#traits : 'TCommanderMigrationHybridCommand',
	#classTraits : 'TCommanderMigrationHybridCommand classTrait',
	#category : 'SystemCommands-MessageCommands',
	#package : 'SystemCommands-MessageCommands'
}

{ #category : 'execution' }
SycMessageMenuCmCommand >> executeComplexRefactoring [

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
SycMessageMenuCmCommand >> initialize [

	super initialize.
	prepared := false
]

{ #category : 'accessing' }
SycMessageMenuCmCommand >> orderInContext: aToolContext [

	^ aToolContext isMethodSourceContext
		ifTrue: [ 1.2 ]
		ifFalse: [ self order ]
]

{ #category : 'preparation' }
SycMessageMenuCmCommand >> prepareFullExecution [

	messages := self context selectedMessages
]
