"
Opens the Extras submenu of the package and tag browser menus, filled with the package Extras commands.
"
Class {
	#name : 'SycOpenExtraInPackageMenuCommand',
	#superclass : 'SycOpenContextMenuCommand',
	#category : 'SystemCommands-PackageCommands',
	#package : 'SystemCommands-PackageCommands'
}

{ #category : 'annotation' }
SycOpenExtraInPackageMenuCommand class >> packageContextMenuActivation [

	<classAnnotation>
	^ ClyContextMenuActivation byRootGroupItemOrder: 10200 for: Package asCalypsoItemContext
]

{ #category : 'annotation' }
SycOpenExtraInPackageMenuCommand class >> taggedClassGroupContextMenuActivation [

	<classAnnotation>
	^ ClyContextMenuActivation byRootGroupItemOrder: 10200 for: ClyTaggedClassGroup asCalypsoItemContext
]

{ #category : 'accessing' }
SycOpenExtraInPackageMenuCommand >> activationStrategy [

	^ SycExtraMenuActivation
]

{ #category : 'building' }
SycOpenExtraInPackageMenuCommand >> addClyCommandsToMenu: aMenuMorph [

	| group |
	group := ClyCommandGroupBuilder buildFor: self cmCommandClass context: self context.
	^ ClyCommandGroupMenuRenderer render: group on: aMenuMorph
]

{ #category : 'accessing' }
SycOpenExtraInPackageMenuCommand >> cmCommandClass [

	^ SycPackageExtraCmCommand
]

{ #category : 'accessing' }
SycOpenExtraInPackageMenuCommand >> defaultMenuIconName [

	^ #smallRedo
]

{ #category : 'accessing' }
SycOpenExtraInPackageMenuCommand >> defaultMenuItemName [

	^ 'Extras'
]
