"
I command to launch the Abstract refactorings: create accessors and abstract the direct instance variable uses into accessors. 
"
Class {
	#name : 'SycAbstractAllInstVarAccessorsCommand',
	#superclass : 'SycClassMenuCmCommand',
	#category : 'SystemCommands-ClassCommands',
	#package : 'SystemCommands-ClassCommands'
}

{ #category : 'accessing' }
SycAbstractAllInstVarAccessorsCommand >> asRefactorings [

	| refactorings env |
	refactorings := classes flatCollect: [ :each |
		                each value collect: [ :var |
			                | refactoring |
			                refactoring := var
				                               createRefactoring:
				                               ReAbstractInstanceVariableRefactoring
				                               for: each key.
			                env := refactoring model.
			                refactoring ] ].
	^ refactorings
]

{ #category : 'accessing' }
SycAbstractAllInstVarAccessorsCommand >> defaultMenuIconName [
	^ #smallAdd
]

{ #category : 'accessing' }
SycAbstractAllInstVarAccessorsCommand >> defaultMenuItemName [
	^'Abstract instance variables'
]

{ #category : 'accessing' }
SycAbstractAllInstVarAccessorsCommand >> fullBrowserOrder [

	^ 2.1
]

{ #category : 'testing' }
SycAbstractAllInstVarAccessorsCommand >> isAvailableInMenuOf: aToolContext [

	^ aToolContext isFullBrowserClassContext
		or: [ aToolContext isSourceCodeContext ]
]

{ #category : 'testing' }
SycAbstractAllInstVarAccessorsCommand >> isComplexRefactoring [
	^ true
]

{ #category : 'accessing' }
SycAbstractAllInstVarAccessorsCommand >> order [

	^ 1000
]

{ #category : 'preparation' }
SycAbstractAllInstVarAccessorsCommand >> prepareFullExecution [

	super prepareFullExecution.
	classes := classes collect: [ :each | self context currentMetaLevelOf: each ].
	self selectVariables
]

{ #category : 'testing' }
SycAbstractAllInstVarAccessorsCommand >> prepareFullExecutionInContext: aToolContext [
	super prepareFullExecutionInContext: aToolContext.

	classes := classes collect: [:each | aToolContext currentMetaLevelOf: each].
	self selectVariables
]

{ #category : 'execution' }
SycAbstractAllInstVarAccessorsCommand >> selectVariables [

	classes := classes collect: [ :aClass |
			           | vars dialog selectedVars |
			           vars := aClass slots asOrderedCollection.
			           dialog := StVariablesSelectionPresenter
				                     title: 'Select variables'
				                     label: aClass name , ' - Select all variables to convert abstract'
				                     withItems: vars
				                     selecting: vars
				                     acceptBlock: [ :items | selectedVars := items ].
			           dialog cancelled ifTrue: [ CmCommandAborted signal ].
			           aClass -> selectedVars ]
]
