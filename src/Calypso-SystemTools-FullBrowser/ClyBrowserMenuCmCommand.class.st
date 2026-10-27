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

{ #category : 'initialization' }
ClyBrowserMenuCmCommand >> initialize [

	super initialize.
	prepared := false
]

{ #category : 'execution' }
ClyBrowserMenuCmCommand >> prepareFullExecution [

	browser := self context browser
]

{ #category : 'execution' }
ClyBrowserMenuCmCommand >> prepareFullExecutionInContext: aToolContext [

	self context: aToolContext.
	self prepareFullExecution.
	prepared := true
]
