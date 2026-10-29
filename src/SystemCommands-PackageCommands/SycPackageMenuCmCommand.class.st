"
I am a Commander2 hybrid for the package commands that show in the full browser package and class group menus. I sit under the v1 SycPackageCommand and keep its legacy lifecycle for the shortcuts, while menus run my subclasses through the Commander2 contract. I am removed together with Commander v1.
"
Class {
	#name : 'SycPackageMenuCmCommand',
	#superclass : 'SycPackageCommand',
	#category : 'SystemCommands-PackageCommands',
	#package : 'SystemCommands-PackageCommands'
}

{ #category : 'testing' }
SycPackageMenuCmCommand >> isAvailableInMenuOf: aToolContext [

	^ aToolContext isFullBrowserPackageContext
]

{ #category : 'execution' }
SycPackageMenuCmCommand >> prepareFullExecution [

	packages := self context selectedPackages
]
