"
I am a command to add packages scope to listScopes
"
Class {
	#name : 'SycAddPackagesScopeCommand',
	#superclass : 'SycPackageCommand',
	#category : 'SystemCommands-PackageCommands-Scope',
	#package : 'SystemCommands-PackageCommands',
	#tag : 'Scope'
}

{ #category : 'accessing' }
SycAddPackagesScopeCommand >> defaultMenuIconName [
	^ #smallPushpin
]

{ #category : 'accessing' }
SycAddPackagesScopeCommand >> defaultMenuItemName [
	^ 'Create scope from selected package(s)'
]

{ #category : 'execution' }
SycAddPackagesScopeCommand >> executeRefactorings [

	| scope |
	scope := ScopesManager newScopeFrom: self packages.
	ScopesManager addScope: scope.
	ScopesPresenter openSelecting: scope
]

{ #category : 'accessing' }
SycAddPackagesScopeCommand >> order [

	^ 1000
]

{ #category : 'execution' }
SycAddPackagesScopeCommand >> prepareFullExecution [

	packages := self context selectedPackageItems collect: [ :packageItem | packageItem actualObject ]
]
