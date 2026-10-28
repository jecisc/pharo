"
I am a submenu for rarely used refactorings
"
Class {
	#name : 'ClyMoreRefactorsMenuGroup',
	#superclass : 'ClyMenuGroup',
	#category : 'Calypso-Browser-MenuGroups',
	#package : 'Calypso-Browser',
	#tag : 'MenuGroups'
}

{ #category : 'accessing' }
ClyMoreRefactorsMenuGroup >> buildContextMenu: aMenu [
	aMenu addLine.

	super buildContextMenu: aMenu.
	aMenu addLine
]

{ #category : 'accessing' }
ClyMoreRefactorsMenuGroup >> name [
	^ 'Refactorings'
]

{ #category : 'accessing' }
ClyMoreRefactorsMenuGroup >> order [
	^10100
]
