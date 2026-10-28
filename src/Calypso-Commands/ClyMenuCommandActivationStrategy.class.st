"
I am the root of the Calypso command activation strategies which represent a command as a menu item. I provide the name, the group and the order of the menu item. My subclasses define the kind of menu they belong to, such as a toolbar or a browser tab.
"
Class {
	#name : 'ClyMenuCommandActivationStrategy',
	#superclass : 'ClyCommandActivationStrategy',
	#instVars : [
		'menuItemOrder',
		'menuGroup',
		'menuItemName'
	],
	#category : 'Calypso-Commands',
	#package : 'Calypso-Commands'
}

{ #category : 'menu creation' }
ClyMenuCommandActivationStrategy class >> buildMenuInContext: aToolContext [
	| menu |
	menu := CmdMenu activatedBy: self.
	menu buildInContext: aToolContext.
	^ menu
]

{ #category : 'instance creation' }
ClyMenuCommandActivationStrategy class >> byItem: itemName of: menuGroupClass for: aToolContextClass [
	^(self byItemOf: menuGroupClass for: aToolContextClass)
		 menuItemName: itemName
]

{ #category : 'instance creation' }
ClyMenuCommandActivationStrategy class >> byItem: itemName of: menuGroupClass order: aNumber for: aToolContextClass [
	^(self byItemOf: menuGroupClass order: aNumber for: aToolContextClass)
		menuItemName: itemName
]

{ #category : 'instance creation' }
ClyMenuCommandActivationStrategy class >> byItemOf: menuGroupClass for: aToolContextClass [
	^(self for: aToolContextClass)
		 menuGroup: menuGroupClass
]

{ #category : 'instance creation' }
ClyMenuCommandActivationStrategy class >> byItemOf: menuGroupClass order: aNumber for: aToolContextClass [
	^(self byItemOf: menuGroupClass for: aToolContextClass)
		menuItemOrder: aNumber
]

{ #category : 'instance creation' }
ClyMenuCommandActivationStrategy class >> byRootGroupItem: itemName for: aToolContextClass [
	^(self byRootGroupItemFor: aToolContextClass)
		menuItemName: itemName
]

{ #category : 'instance creation' }
ClyMenuCommandActivationStrategy class >> byRootGroupItem: itemName order: aNumber for: aToolContextClass [
	^(self byRootGroupItemOrder: aNumber for: aToolContextClass)
		menuItemName: itemName
]

{ #category : 'instance creation' }
ClyMenuCommandActivationStrategy class >> byRootGroupItemFor: aToolContextClass [
	^self byItemOf: CmdRootMenuGroup for: aToolContextClass
]

{ #category : 'instance creation' }
ClyMenuCommandActivationStrategy class >> byRootGroupItemOrder: aNumber for: aToolContextClass [
	^self byItemOf: CmdRootMenuGroup order: aNumber for: aToolContextClass
]

{ #category : 'testing' }
ClyMenuCommandActivationStrategy class >> isAbstract [
	^ self subclasses isEmpty not
]

{ #category : 'initialization' }
ClyMenuCommandActivationStrategy >> initialize [
	super initialize.
	menuItemOrder := 1000.
	menuGroup := CmdRootMenuGroup
]

{ #category : 'accessing' }
ClyMenuCommandActivationStrategy >> menuGroup [
	^ menuGroup
]

{ #category : 'accessing' }
ClyMenuCommandActivationStrategy >> menuGroup: anObject [
	menuGroup := anObject
]

{ #category : 'accessing' }
ClyMenuCommandActivationStrategy >> menuItemName [
	^ menuItemName
]

{ #category : 'accessing' }
ClyMenuCommandActivationStrategy >> menuItemName: anObject [
	menuItemName := anObject
]

{ #category : 'accessing' }
ClyMenuCommandActivationStrategy >> menuItemNameFor: aCommand [
	^ menuItemName ifNil: [ aCommand defaultMenuItemName ]
]

{ #category : 'accessing' }
ClyMenuCommandActivationStrategy >> menuItemOrder [
	^ menuItemOrder
]

{ #category : 'accessing' }
ClyMenuCommandActivationStrategy >> menuItemOrder: anObject [
	menuItemOrder := anObject
]

{ #category : 'printing' }
ClyMenuCommandActivationStrategy >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(.
	menuGroup printOn: aStream.
	aStream nextPutAll: '; '.
	menuItemOrder printOn: aStream.
	aStream nextPut: $)
]
