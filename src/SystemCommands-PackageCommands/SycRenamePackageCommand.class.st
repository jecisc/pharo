"
I am a command to rename given package.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	newName:		<String>
	package:		<Package>
"
Class {
	#name : 'SycRenamePackageCommand',
	#superclass : 'SycPackageMenuCmCommand',
	#instVars : [
		'package',
		'refactoringScopes'
	],
	#category : 'SystemCommands-PackageCommands',
	#package : 'SystemCommands-PackageCommands'
}

{ #category : 'accessing' }
SycRenamePackageCommand >> defaultMenuIconName [
	^ #edit
]

{ #category : 'accessing' }
SycRenamePackageCommand >> defaultMenuItemName [
	^'Rename'
]

{ #category : 'accessing' }
SycRenamePackageCommand >> description [

	^ 'Rename package'
]

{ #category : 'execution' }
SycRenamePackageCommand >> executeRefactorings [

	^ ((ReRenamePackageDriver newApplication: self application) scopes: refactoringScopes packageName: package name) runRefactoring
]

{ #category : 'accessing' }
SycRenamePackageCommand >> order [

	^ 1
]

{ #category : 'execution' }
SycRenamePackageCommand >> prepareFullExecution [

	super prepareFullExecution.
	package := self context lastSelectedPackage.
	refactoringScopes := self context refactoringScopes
]
