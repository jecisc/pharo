"
I am a command to categorize all unclassified methods of given classes
"
Class {
	#name : 'SycCategorizeAllUnclassifiedMethodsCommand',
	#superclass : 'SycClassCommand',
	#category : 'SystemCommands-ClassCommands',
	#package : 'SystemCommands-ClassCommands'
}

{ #category : 'accessing' }
SycCategorizeAllUnclassifiedMethodsCommand >> defaultMenuIconName [
	^#browse
]

{ #category : 'accessing' }
SycCategorizeAllUnclassifiedMethodsCommand >> defaultMenuItemName [
	^'Categorize all uncategorized'
]

{ #category : 'execution' }
SycCategorizeAllUnclassifiedMethodsCommand >> executeRefactoring [
	"MethodClassifier should not be hardcoded and should be based on Smalltalk tools"

	classes do: [ :each | each uncategorizedSelectors do: [ :selector | MethodClassifier classify: each >> selector ] ]
]

{ #category : 'testing' }
SycCategorizeAllUnclassifiedMethodsCommand >> isAvailableInMenuOf: aToolContext [

	^ aToolContext isFullBrowserMethodGroupContext
]

{ #category : 'accessing' }
SycCategorizeAllUnclassifiedMethodsCommand >> order [

	^ 10000
]

{ #category : 'execution' }
SycCategorizeAllUnclassifiedMethodsCommand >> prepareFullExecution [

	super prepareFullExecution.
	classes := classes collect: [ :each | self context currentMetaLevelOf: each ]
]
