"
I am a command to move all methods of given method groups to another package.

Internal Representation and Key Implementation Points.

    Instance Variables
	package:		<Package>
"
Class {
	#name : 'ClyMoveMethodGroupsToPackageCommand',
	#superclass : 'ClyMethodGroupMenuCmCommand',
	#instVars : [
		'package'
	],
	#category : 'Calypso-SystemTools-FullBrowser-Commands-MethodGroups',
	#package : 'Calypso-SystemTools-FullBrowser',
	#tag : 'Commands-MethodGroups'
}

{ #category : 'testing' }
ClyMoveMethodGroupsToPackageCommand class >> canBeExecutedInContext: aToolContext [

	^ aToolContext isProtocolSelected
]

{ #category : 'activation' }
ClyMoveMethodGroupsToPackageCommand class >> fullBrowserDragAndDropActivation [
	<classAnnotation>

	^ClyDragAndDropActivation
		for: ClyMethodGroup asCalypsoItemContext
		toDropIn: Package asCalypsoItemContext
]

{ #category : 'accessing' }
ClyMoveMethodGroupsToPackageCommand >> defaultMenuItemName [

	^'Convert to extension'
]

{ #category : 'execution' }
ClyMoveMethodGroupsToPackageCommand >> executeRefactorings [

	| repackagingCommand |
	methodGroups do: [ :group |
			repackagingCommand := SycMoveMethodsToPackageCommand for: group methods to: package.
			repackagingCommand execute.
			group removeWithMethods ]
]

{ #category : 'accessing' }
ClyMoveMethodGroupsToPackageCommand >> order [

	^ 1000
]

{ #category : 'accessing' }
ClyMoveMethodGroupsToPackageCommand >> package [
	^ package
]

{ #category : 'accessing' }
ClyMoveMethodGroupsToPackageCommand >> package: anObject [
	package := anObject
]

{ #category : 'execution' }
ClyMoveMethodGroupsToPackageCommand >> prepareExecutionInDropContext: aToolContext [
	super prepareExecutionInDropContext: aToolContext.
	package := aToolContext lastSelectedPackage
]

{ #category : 'execution' }
ClyMoveMethodGroupsToPackageCommand >> prepareFullExecution [

	super prepareFullExecution.
	package := self context requestSinglePackage: 'Choose package'
]
