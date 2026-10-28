Extension { #name : 'ClyCommand' }

{ #category : '*SystemCommands-RefactoringSupport' }
ClyCommand >> confirmRefactoringInContext: aToolContext by: aCommandActivator [

	| submitDialog |
	submitDialog := SycRefactoringPreviewPresenter for: self scopes: aToolContext refactoringScopes.
	submitDialog existChanges
		ifTrue: [
			submitDialog openDialog
				okAction: [
					submitDialog accept.
					aCommandActivator applyCommandResult ];
				cancelAction: [ :p | p beCancel ] ]
		ifFalse: [ submitDialog alert: 'There is no change produced by this refactoring' ].
	CmCommandAborted signal
]

{ #category : '*SystemCommands-RefactoringSupport' }
ClyCommand >> executeRefactorings [
	self asRefactorings do: [ :each | each execute ]
]

{ #category : '*SystemCommands-RefactoringSupport' }
ClyCommand >> isComplexRefactoring [
	^false
]
