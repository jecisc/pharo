"
I am a command to migrate references of a given class to another.

Internal Representation and Key Implementation Points.

Instance Variables
newName:  <String>
"
Class {
	#name : 'SycMigrateReferencesOfClassCommand',
	#superclass : 'SycSingleClassCommand',
	#instVars : [
		'newName'
	],
	#category : 'SystemCommands-ClassCommands',
	#package : 'SystemCommands-ClassCommands'
}

{ #category : 'accessing' }
SycMigrateReferencesOfClassCommand >> defaultMenuIconName [
	^ #source
]

{ #category : 'accessing' }
SycMigrateReferencesOfClassCommand >> defaultMenuItemName [
	^'Migrate references'
]

{ #category : 'execution' }
SycMigrateReferencesOfClassCommand >> executeRefactorings [

	self asRefactorings do: [ :ref | ref execute ]
]

{ #category : 'accessing' }
SycMigrateReferencesOfClassCommand >> fullBrowserOrder [

	^ 1.4
]

{ #category : 'testing' }
SycMigrateReferencesOfClassCommand >> isAvailableInMenuOf: aToolContext [

	^ aToolContext isFullBrowserClassContext
		or: [ aToolContext isSourceCodeContext ]
]

{ #category : 'testing' }
SycMigrateReferencesOfClassCommand >> isComplexRefactoring [
	^ true
]

{ #category : 'accessing' }
SycMigrateReferencesOfClassCommand >> order [

	^ 1.3
]

{ #category : 'preparation' }
SycMigrateReferencesOfClassCommand >> prepareFullExecution [

	super prepareFullExecution.
	newName := self context requestSingleClass: 'Choose new class'
]
