"
I am a command to open browser on given class
"
Class {
	#name : 'SycBrowseClassCommand',
	#superclass : 'SycSingleClassCommand',
	#category : 'SystemCommands-ClassCommands',
	#package : 'SystemCommands-ClassCommands'
}

{ #category : 'accessing' }
SycBrowseClassCommand >> defaultMenuIconName [
	^#browse
]

{ #category : 'accessing' }
SycBrowseClassCommand >> defaultMenuItemName [
	^'Browse'
]

{ #category : 'execution' }
SycBrowseClassCommand >> executeRefactoring [
	targetClass browse
]

{ #category : 'testing' }
SycBrowseClassCommand >> isAvailableInMenuOf: aToolContext [

	^ aToolContext isSourceCodeContext
]

{ #category : 'accessing' }
SycBrowseClassCommand >> menuGroup [

	^ ClyQueryMenuGroup
]

{ #category : 'accessing' }
SycBrowseClassCommand >> order [

	^ 1000
]

{ #category : 'preparation' }
SycBrowseClassCommand >> prepareFullExecution [

	| scope |
	scope := RBBrowserEnvironment new.
	targetClass := (scope at: self context selectedSourceNode name)
		ifNil: [ self context lastSelectedClass ]
]
