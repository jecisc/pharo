"
Opens an inspector on the last selected package.
"
Class {
	#name : 'SycInspectPackageCommand',
	#superclass : 'SycPackageExtraCmCommand',
	#category : 'SystemCommands-PackageCommands',
	#package : 'SystemCommands-PackageCommands'
}

{ #category : 'execution' }
SycInspectPackageCommand >> executeRefactoring [

	(Smalltalk tools toolNamed: #inspector) openOn: context lastSelectedPackage
]

{ #category : 'accessing' }
SycInspectPackageCommand >> icon [

	^ self iconNamed: #inspect
]

{ #category : 'testing' }
SycInspectPackageCommand >> isApplicable [

	^ context isAboutBrowserItemType: Package
]

{ #category : 'accessing' }
SycInspectPackageCommand >> name [

	^ 'Inspect'
]
