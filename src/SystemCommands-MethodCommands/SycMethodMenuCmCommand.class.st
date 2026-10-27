"
I am a Commander2 hybrid for the method commands that show in the full browser method menus. I sit under the v1 SycMethodCommand and keep its legacy lifecycle for the shortcuts, while menus run my subclasses through the Commander2 contract. I am removed together with Commander v1.
"
Class {
	#name : 'SycMethodMenuCmCommand',
	#superclass : 'SycMethodCommand',
	#traits : 'TCommanderMigrationHybridCommand',
	#classTraits : 'TCommanderMigrationHybridCommand classTrait',
	#category : 'SystemCommands-MethodCommands',
	#package : 'SystemCommands-MethodCommands'
}

{ #category : 'initialization' }
SycMethodMenuCmCommand >> initialize [

	super initialize.
	prepared := false
]

{ #category : 'execution' }
SycMethodMenuCmCommand >> prepareFullExecution [

	methods := self context selectedMethods
]

{ #category : 'execution' }
SycMethodMenuCmCommand >> prepareFullExecutionInContext: aToolContext [

	self context: aToolContext.
	self prepareFullExecution.
	prepared := true
]
