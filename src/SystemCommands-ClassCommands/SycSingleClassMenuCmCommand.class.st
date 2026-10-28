Class {
	#name : 'SycSingleClassMenuCmCommand',
	#superclass : 'SycSingleClassCommand',
	#traits : 'TCommanderMigrationHybridCommand',
	#classTraits : 'TCommanderMigrationHybridCommand classTrait',
	#category : 'SystemCommands-ClassCommands',
	#package : 'SystemCommands-ClassCommands'
}

{ #category : 'execution' }
SycSingleClassMenuCmCommand >> executeComplexRefactoring [

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
SycSingleClassMenuCmCommand >> initialize [

	super initialize.
	prepared := false
]

{ #category : 'accessing' }
SycSingleClassMenuCmCommand >> orderInContext: aToolContext [

	^ aToolContext isFullBrowserClassContext
		ifTrue: [ self fullBrowserOrder ]
		ifFalse: [ self order ]
]

{ #category : 'preparation' }
SycSingleClassMenuCmCommand >> prepareFullExecution [

	targetClass := self context lastSelectedClass
]
