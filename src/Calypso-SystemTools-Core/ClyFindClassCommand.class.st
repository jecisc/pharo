"
I am a command to find class and show it in the browser.

By default I am executed by cmd+f shortcut
"
Class {
	#name : 'ClyFindClassCommand',
	#superclass : 'ClyBrowserMenuCmCommand',
	#instVars : [
		'class'
	],
	#category : 'Calypso-SystemTools-Core-Commands-Classes',
	#package : 'Calypso-SystemTools-Core',
	#tag : 'Commands-Classes'
}

{ #category : 'accessing' }
ClyFindClassCommand >> defaultMenuIconName [
	^#smallFind
]

{ #category : 'accessing' }
ClyFindClassCommand >> defaultMenuItemName [
	^'Find class'
]

{ #category : 'execution' }
ClyFindClassCommand >> executeRefactorings [

	browser selectClass: class
]

{ #category : 'testing' }
ClyFindClassCommand >> isAvailableInMenuOf: aToolContext [

	^ aToolContext isFullBrowserPackageContext
]

{ #category : 'accessing' }
ClyFindClassCommand >> menuGroup [

	^ ClyQueryMenuGroup
]

{ #category : 'accessing' }
ClyFindClassCommand >> order [

	^ 1000
]

{ #category : 'execution' }
ClyFindClassCommand >> prepareFullExecution [

	super prepareFullExecution.
	class := self context requestSingleClass: 'Choose class'
]
