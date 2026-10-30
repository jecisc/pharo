"
I am a menu item of a Calypso context menu which wraps the activator of one command. I take my name, order and activity from the activator, and I build the entry of the menu of the tool.
"
Class {
	#name : 'ClyActivatorMenuItem',
	#superclass : 'ClyMenuItem',
	#instVars : [
		'activator'
	],
	#category : 'Calypso-Commands',
	#package : 'Calypso-Commands'
}

{ #category : 'instance creation' }
ClyActivatorMenuItem class >> activatingBy: aMenuCommandActivator [
	^self new
		activator: aMenuCommandActivator
]

{ #category : 'accessing' }
ClyActivatorMenuItem >> activator [
	^ activator
]

{ #category : 'accessing' }
ClyActivatorMenuItem >> activator: anObject [
	activator := anObject
]

{ #category : 'spec2 compatibility' }
ClyActivatorMenuItem >> addToMenuPresenter: aSpMenuPresenter [
	aSpMenuPresenter
		addItem: [ :anItem |
			anItem
				name: self name;
				icon: self icon;
				action: [ self executeCommand ];
				enabled: self isActive;
				description: self command class name.
				self getShortcutTipForMenuItem ifNotNil: [ :shortcut | anItem shortcut: shortcut ] ]
]

{ #category : 'context menu' }
ClyActivatorMenuItem >> buildContextMenu: aMenuView [

	activator buildContextMenu: aMenuView
]

{ #category : 'accessing' }
ClyActivatorMenuItem >> command [
	^ activator command
]

{ #category : 'accessing' }
ClyActivatorMenuItem >> description [
	^activator commandDescription
]

{ #category : 'execution' }
ClyActivatorMenuItem >> executeCommand [
	activator executeCommand
]

{ #category : 'accessing' }
ClyActivatorMenuItem >> findGroupLike: menuGroupClass ifExists: aBlockClosure [
]

{ #category : 'spec2 compatibility' }
ClyActivatorMenuItem >> getShortcutTipForMenuItem [

	^ self activator getShortcutTipForMenuItem
]

{ #category : 'accessing' }
ClyActivatorMenuItem >> icon [
	^activator menuItemIcon
]

{ #category : 'testing' }
ClyActivatorMenuItem >> includesCommand: aCommandClass [

	^activator activatesCommand: aCommandClass
]

{ #category : 'testing' }
ClyActivatorMenuItem >> isActive [
	^activator canExecuteCommand
]

{ #category : 'testing' }
ClyActivatorMenuItem >> isCommandItem [
	^true
]

{ #category : 'testing' }
ClyActivatorMenuItem >> isSimilarTo: aMenuItem [
	^self class == aMenuItem class and: [
		activator isSimilarTo: aMenuItem activator]
]

{ #category : 'accessing' }
ClyActivatorMenuItem >> name [
	^activator menuItemName
]

{ #category : 'accessing' }
ClyActivatorMenuItem >> order [
	^activator menuItemOrder
]

{ #category : 'printing' }
ClyActivatorMenuItem >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(.
	aStream nextPutAll: self name.
	aStream nextPut: $)
]

{ #category : 'context menu' }
ClyActivatorMenuItem >> registerContextMenuItemsWithBuilder: aBuilder [

	activator registerContextMenuItemsFor: self withBuilder: aBuilder
]

{ #category : 'context menu' }
ClyActivatorMenuItem >> setUpShortcutTipForMenuItem: aMenuItemMorph [

	self activator setUpShortcutTipForMenuItem: aMenuItemMorph
]

{ #category : 'updating' }
ClyActivatorMenuItem >> synchronizeContentWith: anotherMenuItem [
]
