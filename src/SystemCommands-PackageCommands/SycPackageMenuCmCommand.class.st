"
I am a Commander2 hybrid for the package commands that show in the full browser package and class group menus. I sit under the v1 SycPackageCommand and keep its legacy lifecycle for the shortcuts, while menus run my subclasses through the Commander2 contract. I am removed together with Commander v1.
"
Class {
	#name : 'SycPackageMenuCmCommand',
	#superclass : 'SycPackageCommand',
	#traits : 'TCommanderMigrationHybridCommand',
	#classTraits : 'TCommanderMigrationHybridCommand classTrait',
	#category : 'SystemCommands-PackageCommands',
	#package : 'SystemCommands-PackageCommands'
}

{ #category : 'initialization' }
SycPackageMenuCmCommand >> initialize [

	super initialize.
	prepared := false
]

{ #category : 'testing' }
SycPackageMenuCmCommand >> isAvailableInMenuOf: aToolContext [

	^ aToolContext isFullBrowserPackageContext
]

{ #category : 'execution' }
SycPackageMenuCmCommand >> prepareFullExecution [

	packages := self context selectedPackages
]

{ #category : 'execution' }
SycPackageMenuCmCommand >> prepareFullExecutionInContext: aToolContext [

	self context: aToolContext.
	self prepareFullExecution.
	prepared := true
]
