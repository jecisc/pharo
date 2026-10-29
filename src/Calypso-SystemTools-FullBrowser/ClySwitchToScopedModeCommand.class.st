Class {
	#name : 'ClySwitchToScopedModeCommand',
	#superclass : 'ClyBrowserCommand',
	#instVars : [
		'packages'
	],
	#category : 'Calypso-SystemTools-FullBrowser-Commands-Packages',
	#package : 'Calypso-SystemTools-FullBrowser',
	#tag : 'Commands-Packages'
}

{ #category : 'accessing' }
ClySwitchToScopedModeCommand >> defaultMenuItemName [
	^'Set up scope'
]

{ #category : 'execution' }
ClySwitchToScopedModeCommand >> executeRefactoring [

	self browser switchToPackageScopeOf: packages
]

{ #category : 'testing' }
ClySwitchToScopedModeCommand >> isAvailableInMenuOf: aToolContext [

	^ aToolContext isFullBrowserPackageContext
]

{ #category : 'accessing' }
ClySwitchToScopedModeCommand >> order [

	^ 1000
]

{ #category : 'accessing' }
ClySwitchToScopedModeCommand >> packages [
	^ packages
]

{ #category : 'accessing' }
ClySwitchToScopedModeCommand >> packages: anObject [
	packages := anObject
]

{ #category : 'execution' }
ClySwitchToScopedModeCommand >> prepareFullExecution [

	super prepareFullExecution.
	packages := StBrowserSearchPresenter searchConfiguring: [ :presenter :dialog |
			            dialog title: 'Select package scope'.
			            presenter
				            items: (self browser itemsForQuery: ClyAllPackagesQuery sorted);
				            multipleSelection ]
]
