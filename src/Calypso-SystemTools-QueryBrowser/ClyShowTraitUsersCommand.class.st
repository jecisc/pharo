"
Retrieves the selected class traits.
"
Class {
	#name : 'ClyShowTraitUsersCommand',
	#superclass : 'SycClassCommand',
	#instVars : [
		'browser'
	],
	#category : 'Calypso-SystemTools-QueryBrowser-Commands-Queries',
	#package : 'Calypso-SystemTools-QueryBrowser',
	#tag : 'Commands-Queries'
}

{ #category : 'accessing' }
ClyShowTraitUsersCommand >> browser [

	^ browser
]

{ #category : 'accessing' }
ClyShowTraitUsersCommand >> browser: anObject [

	browser := anObject
]

{ #category : 'accessing' }
ClyShowTraitUsersCommand >> defaultMenuItemName [
	^'Show trait users'
]

{ #category : 'execution' }
ClyShowTraitUsersCommand >> executeRefactoring [

	classes first isTrait ifTrue: [ (Smalltalk tools toolNamed: #messageList) browseUsersOfTrait: classes first ]
]

{ #category : 'testing' }
ClyShowTraitUsersCommand >> isAvailableInMenuOf: aToolContext [

	^ aToolContext isFullBrowserClassContext
]

{ #category : 'accessing' }
ClyShowTraitUsersCommand >> menuGroup [

	^ ClyQueryMenuGroup
]

{ #category : 'accessing' }
ClyShowTraitUsersCommand >> order [

	^ 1000
]

{ #category : 'execution' }
ClyShowTraitUsersCommand >> prepareFullExecution [

	super prepareFullExecution.
	browser := self context browser
]
