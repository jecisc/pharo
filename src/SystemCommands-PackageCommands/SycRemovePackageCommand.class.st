"
I am a command to remove given packages
"
Class {
	#name : 'SycRemovePackageCommand',
	#superclass : 'SycPackageCommand',
	#category : 'SystemCommands-PackageCommands',
	#package : 'SystemCommands-PackageCommands'
}

{ #category : 'accessing' }
SycRemovePackageCommand class >> defaultMenuIconName [
	^ #delete
]

{ #category : 'execution' }
SycRemovePackageCommand >> applyResultInContext: aToolContext [
	"Update the browser's title and method editor  after removal of a package"

	| browserTool |
	
	super applyResultInContext: aToolContext.

	browserTool := aToolContext tool.
	aToolContext tool navigationEnvironment: ClyNavigationEnvironment currentImage.
	browserTool 
		updateWindowTitle;
		updateMethodEditorAfterPackageRemoval.
	
]

{ #category : 'accessing' }
SycRemovePackageCommand >> defaultMenuIconName [
	^#remove
]

{ #category : 'accessing' }
SycRemovePackageCommand >> defaultMenuItemName [
	^'Remove'
]

{ #category : 'accessing' }
SycRemovePackageCommand >> description [

	^ 'Removes Packages.'
]

{ #category : 'execution' }
SycRemovePackageCommand >> executeRefactorings [

	self packages do: [ :each | each removeFromSystem ].
	self packages: OrderedCollection new
]

{ #category : 'accessing' }
SycRemovePackageCommand >> order [

	^ 10000
]

{ #category : 'execution' }
SycRemovePackageCommand >> prepareFullExecution [

	| packagesWithClasses names answer |
	super prepareFullExecution.
	packagesWithClasses := self packages reject: [ :each | each isEmpty ].
	packagesWithClasses ifNotEmpty: [
			names := (packagesWithClasses collect: [ :package | package name ]) joinUsing: ', '.
			answer := self morphicUIManager confirm: 'Are you sure you want to delete the selection(s)?' , String cr , names , ' still contains classes.'.
			answer ifFalse: [ CmCommandAborted signal ] ]
]
