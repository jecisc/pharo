"
I am a command to move given instance variable to its class side
"
Class {
	#name : 'SycMoveInstanceVariableToClassSideCommand',
	#superclass : 'SycVariableCmCommand',
	#category : 'SystemCommands-VariableCommands',
	#package : 'SystemCommands-VariableCommands'
}

{ #category : 'activation' }
SycMoveInstanceVariableToClassSideCommand class >> fullBrowserMenuActivation [

	<classAnnotation>
	^ CmdContextMenuActivation byRootGroupItemFor: ClyFullBrowserVariableContext
]

{ #category : 'accessing' }
SycMoveInstanceVariableToClassSideCommand >> defaultMenuIconName [
	^ #smallRedo
]

{ #category : 'accessing' }
SycMoveInstanceVariableToClassSideCommand >> defaultMenuItemName [

	^ '(T) Move to class side'
]

{ #category : 'execution' }
SycMoveInstanceVariableToClassSideCommand >> executeRefactorings [

	^ ((ReMoveVariablesToClassSideDriver newApplication: self application) scopes: refactoringScopes variables: variables)
		runRefactoring
]

{ #category : 'accessing' }
SycMoveInstanceVariableToClassSideCommand >> order [

	^ 1.6
]
