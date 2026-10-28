"
I am the root of the Calypso commands. I am a Commander2 command, and I keep the helper methods that the v1 activators and the Calypso morphs (toolbar, tab, table cells, context menus) still call on a command, so that commands can move off the Commander v1 base classes.
"
Class {
	#name : 'ClyCommand',
	#superclass : 'CmCommand',
	#category : 'Calypso-Commands',
	#package : 'Calypso-Commands'
}

{ #category : 'testing' }
ClyCommand class >> canBeExecutedInContext: aToolContext [
	^self isAbstract not
]

{ #category : 'accessing' }
ClyCommand class >> defaultMenuIconName [
	"For compatibility the actual icon named can be defined on class side.
	But right way it to use same instance side method.

	Not really nice to return nil. But it is already expected by many tools.
	So it is easy to allow nil.
	But users should use instance side method defaultMenuIcon which should return Form instance"
	^nil
]

{ #category : 'accessing' }
ClyCommand class >> defaultMenuItemName [
	"It should be defined on instance side.
	But for compatibility default instance side method delegates to class side"
	^self name
]

{ #category : 'testing' }
ClyCommand class >> isAbstract [
	^self = ClyCommand
]

{ #category : 'ui requests' }
ClyCommand >> application [

	^ StPharoApplication current
]

{ #category : 'execution' }
ClyCommand >> applyResultInContext: aToolContext [
]

{ #category : 'converting' }
ClyCommand >> asCommandActivator [
	^CmdCommandActivator new
		command: self;
		context: CmdNullToolContext new;
		activationStrategy: (CmdManualActivationStrategy withAnnotatedClass: self class)
]

{ #category : 'ui requests' }
ClyCommand >> confirm: aString [

	^ self application confirm:  aString
]

{ #category : 'accessing' }
ClyCommand >> defaultMenuIcon [

	^ self defaultMenuIconFormSet ifNotNil: [ :formSet | formSet asForm ]
]

{ #category : 'accessing' }
ClyCommand >> defaultMenuIconFormSet [
	"By default the result is nil which is not really nice
	but it is already expected by many tools.	So it is easy to allow nil.
	For simple cases users should implement class side method #defaultMenuIconName"
	^self defaultMenuIconName ifNotNil: [ :iconName |
		Smalltalk ui iconFormSetNamed: iconName ]
]

{ #category : 'accessing' }
ClyCommand >> defaultMenuIconName [
	"For compatibility it delegates actual logic to class side. But it should be just
		^nil
	Not really nice to return nil. But it is already expected by many tools.
	So it is easy to allow nil.
	When users want to define real icon instead of standard named icon
	they should override another instance side method #defaultMenuIcon
	which should return desired Form instance"
	^self class defaultMenuIconName
]

{ #category : 'accessing' }
ClyCommand >> defaultMenuItemName [
	"For compatibility default instance side method delegates to class side.
	But normally it should just return
		self class name"

	^self class defaultMenuItemName
]

{ #category : 'accessing' }
ClyCommand >> description [
	"By default the result is nil which is not really nice
	but it is already expected by many tools. So it is easy to allow nil"
	^nil
]

{ #category : 'accessing' }
ClyCommand >> morphicUIManager [

	^ MorphicUIManager new
]

{ #category : 'execution' }
ClyCommand >> prepareFullExecutionInContext: aToolContext [
]

{ #category : 'execution' }
ClyCommand >> readParametersFromContext: aToolContext [
]

{ #category : 'accessing' }
ClyCommand >> secureMenuIcon [
	"In case when icon should be mandatory property of command
	users should call this method. It ensure Form instance
	which will indicate missing icon as a problem"

	^self defaultMenuIcon ifNil: [ Smalltalk ui iconNamed: #error ]
]

{ #category : 'accessing' }
ClyCommand >> specUIManager [

	^ SpAlertDialog new
]
