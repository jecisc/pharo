"
I am a command to open dependency browser on set of packages
"
Class {
	#name : 'ClyOpenDependencyBrowserCommand',
	#superclass : 'SycPackageMenuCmCommand',
	#category : 'Calypso-SystemPlugins-DependencyAnalyser-Browser',
	#package : 'Calypso-SystemPlugins-DependencyAnalyser-Browser'
}

{ #category : 'accessing' }
ClyOpenDependencyBrowserCommand >> defaultMenuItemName [
	^'Browse dependencies'
]

{ #category : 'execution' }
ClyOpenDependencyBrowserCommand >> executeRefactorings [

	(StPackageDependenciesPresenter onPackagesNamed: (packages collect: [ :package | package name ])) open
]

{ #category : 'accessing' }
ClyOpenDependencyBrowserCommand >> menuGroup [

	^ ClyQueryMenuGroup
]

{ #category : 'accessing' }
ClyOpenDependencyBrowserCommand >> order [

	^ 1000
]
