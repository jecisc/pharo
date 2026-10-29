"
I am a command to open a critic browser on given set of packages
"
Class {
	#name : 'ClyOpenCriticBrowserCommand',
	#superclass : 'SycPackageCommand',
	#category : 'Calypso-SystemPlugins-Critic-Browser',
	#package : 'Calypso-SystemPlugins-Critic-Browser'
}

{ #category : 'activation' }
ClyOpenCriticBrowserCommand >> defaultMenuItemName [
	^'Browse critiques'
]

{ #category : 'execution' }
ClyOpenCriticBrowserCommand >> executeRefactoring [

	| env |
	env := RBPackageEnvironment new packages: packages.
	StCritiqueRuleSelectorPresenter openWithEnvironment: env removeTestCase: false
]

{ #category : 'accessing' }
ClyOpenCriticBrowserCommand >> menuGroup [

	^ ClyQueryMenuGroup
]

{ #category : 'accessing' }
ClyOpenCriticBrowserCommand >> order [

	^ 1000
]
