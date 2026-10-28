"
I am a Commander2 hybrid for the variable refactorings (protect, push up, push down, move to class side, remove variables, generate accessors, rename variable). I sit under the v1 SycRefactorVariableCommand so the Full Browser menus and shortcuts keep their legacy lifecycle, and I add the Commander2 contract: canBeExecuted, execute with a prepared flag, context, order and menu group. I am removed together with Commander v1.
"
Class {
	#name : 'SycVariableCmCommand',
	#superclass : 'SycRefactorVariableCommand',
	#traits : 'TCommanderMigrationHybridCommand',
	#classTraits : 'TCommanderMigrationHybridCommand classTrait',
	#category : 'SystemCommands-VariableCommands',
	#package : 'SystemCommands-VariableCommands'
}

{ #category : 'initialization' }
SycVariableCmCommand >> initialize [

	super initialize.
	prepared := false
]

{ #category : 'accessing' }
SycVariableCmCommand >> orderInContext: aToolContext [

	^ aToolContext isFullBrowserVariableContext
		ifTrue: [ self fullBrowserOrder ]
		ifFalse: [ self order ]
]

{ #category : 'execution' }
SycVariableCmCommand >> prepareFullExecution [

	variables := self context selectedVariables.
	toolContext := self context.
	refactoringScopes := self context refactoringScopes
]

{ #category : 'execution' }
SycVariableCmCommand >> prepareFullExecutionInContext: aToolContext [

	self context: aToolContext.
	self prepareFullExecution.
	prepared := true
]
