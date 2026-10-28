"
I am a Commander2 hybrid for the commands on critiques of the critic browser and critic table. I sit under the v1 ClyCritiqueCommand and keep its legacy lifecycle for the table icons, while menus run my subclasses through the Commander2 contract. I am removed together with Commander v1.
"
Class {
	#name : 'ClyCritiqueCmCommand',
	#superclass : 'ClyCritiqueCommand',
	#traits : 'TCommanderMigrationHybridCommand',
	#classTraits : 'TCommanderMigrationHybridCommand classTrait',
	#category : 'Calypso-SystemPlugins-Critic-Browser',
	#package : 'Calypso-SystemPlugins-Critic-Browser'
}

{ #category : 'testing' }
ClyCritiqueCmCommand class >> isAbstract [

	^ self subclasses isEmpty not
]

{ #category : 'execution' }
ClyCritiqueCmCommand >> executeComplexRefactoring [

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
ClyCritiqueCmCommand >> initialize [

	super initialize.
	prepared := false
]

{ #category : 'execution' }
ClyCritiqueCmCommand >> prepareFullExecution [

	critique := self context selectedCritique.
	analyzedObject := self context analyzedObject
]
