"
I am a Commander2 hybrid for the source code refactorings (inline, extract, convert temp, rename temp, move temp definition, run test). I sit under the v1 SycSourceCodeRefactoringCommand and keep its legacy lifecycle for the shortcuts, while the Source code menu runs my subclasses through the Commander2 contract. Subclasses define executeRefactorings and order. I am removed together with Commander v1.
"
Class {
	#name : 'SycSourceCodeRefactoringCmCommand',
	#superclass : 'SycSourceCodeRefactoringCommand',
	#traits : 'TCommanderMigrationHybridCommand',
	#classTraits : 'TCommanderMigrationHybridCommand classTrait',
	#category : 'SystemCommands-SourceCodeCommands',
	#package : 'SystemCommands-SourceCodeCommands'
}

{ #category : 'execution' }
SycSourceCodeRefactoringCmCommand >> executeRefactorings [

	^ self executeRefactoring: self asRefactorings
]

{ #category : 'initialization' }
SycSourceCodeRefactoringCmCommand >> initialize [

	super initialize.
	prepared := false
]

{ #category : 'accessing' }
SycSourceCodeRefactoringCmCommand >> orderInContext: aToolContext [

	^ self order
]

{ #category : 'execution' }
SycSourceCodeRefactoringCmCommand >> prepareFullExecution [

	method := self context lastSelectedMethod.
	sourceNode := self context lastSelectedSourceNode.
	refactoringScopes := self context refactoringScopes
]

{ #category : 'execution' }
SycSourceCodeRefactoringCmCommand >> prepareFullExecutionInContext: aToolContext [

	self context: aToolContext.
	self prepareFullExecution.
	prepared := true
]
