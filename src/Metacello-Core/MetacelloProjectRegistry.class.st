Class {
	#name : 'MetacelloProjectRegistry',
	#superclass : 'Object',
	#instVars : [
		'projectSpecsRegistry'
	],
	#classVars : [
		'Registry'
	],
	#category : 'Metacello-Core-Registry',
	#package : 'Metacello-Core',
	#tag : 'Registry'
}

{ #category : 'baselines' }
MetacelloProjectRegistry class >> baselineClasses [
	"Return a set of the Metacello baseline classes that have been loaded into the image."

	^ BaselineOf allSubclasses
]

{ #category : 'copying' }
MetacelloProjectRegistry class >> copyRegistryDuring: aBlock commitIfSuccess: aBoolean [
	"install copy of registry for duration of <aBlock> execution."

	"registrations will be copied on write during <aBlock> execution."

	"if <aBlock> does not return control to this context, revert to the original
	version of the registry. Otherwise leave the new copy installed."

	| oldRegistry newRegistry |
	oldRegistry := self registry.
	newRegistry := self registry copy.
	self registry: newRegistry.
	aBlock ensure: [ "install old version of registry"
		newRegistry := self registry. "see https://github.com/dalehenrich/metacello-work/issues/210"
		self registry: oldRegistry ].

	aBoolean ifTrue: [ self registry: newRegistry ]
]

{ #category : 'registry' }
MetacelloProjectRegistry class >> registry [

	^ Registry ifNil: [ Registry := self new ]
]

{ #category : 'accessing' }
MetacelloProjectRegistry class >> registry: aMetacelloProjectRegistry [

	Registry := aMetacelloProjectRegistry
]

{ #category : 'initialization' }
MetacelloProjectRegistry class >> resetRegistry [

	<script>
	Registry := nil
]

{ #category : 'accessing' }
MetacelloProjectRegistry class >> useRegistry: aRegistry during: aBlock [

	| oldRegistry |
	oldRegistry := Registry.
	Registry := MetacelloProjectRegistry new.
	[ aBlock value ] ensure: [ Registry := oldRegistry ]
]

{ #category : 'baselines' }
MetacelloProjectRegistry >> baselineNameFrom: baseName [
	"Return the fully-qualified configuration class name."

	^ (baseName indexOfSubCollection: 'BaselineOf') > 0
		  ifTrue: [ baseName ]
		  ifFalse: [ 'BaselineOf' , baseName ]
]

{ #category : 'accessing' }
MetacelloProjectRegistry >> isEmpty [

	^ self projectSpecs isEmpty
]

{ #category : 'copying' }
MetacelloProjectRegistry >> postCopy [

	super postCopy.
	projectSpecsRegistry := self projectSpecsRegistry copy
]

{ #category : 'querying' }
MetacelloProjectRegistry >> projectSpecForClassNamed: aClassName ifAbsent: absentBlock [

	^ (self projectSpecsRegistry at: aClassName ifAbsent: [ ^ absentBlock value ]) projectSpec
]

{ #category : 'accessing' }
MetacelloProjectRegistry >> projectSpecs [

	^ self projectSpecsRegistry values collect: [ :registration | registration projectSpec ]
]

{ #category : 'accessing' }
MetacelloProjectRegistry >> projectSpecsRegistry [

	^ projectSpecsRegistry ifNil: [ projectSpecsRegistry := Dictionary new ]
]

{ #category : 'registration' }
MetacelloProjectRegistry >> registerProjectRegistration: aMetacelloProjectRegistration [
	"unconditionally register <newRegistration> ... use with care"

	| spec |
	spec := aMetacelloProjectRegistration projectSpec.
	self projectSpecsRegistry at: spec className ifPresent: [ :existing |
			existing projectSpec className = spec className ifFalse: [
				MetacelloNotification signal: 'REGISTRATION OF INCOMPATABLE PROJECTS: ' , existing printString , ' REPLACED BY ' , aMetacelloProjectRegistration printString ] ].
	aMetacelloProjectRegistration ensureVersionString: spec repositoryVersionString.
	self projectSpecsRegistry at: spec className put: aMetacelloProjectRegistration
]

{ #category : 'registration' }
MetacelloProjectRegistry >> registrationFor: aMetacelloProjectSpec ifPresent: presentBlock ifAbsent: absentBlock [

	^ self registrationForClassNamed: aMetacelloProjectSpec className ifPresent: presentBlock ifAbsent: absentBlock
]

{ #category : 'registration' }
MetacelloProjectRegistry >> registrationForClassNamed: aClassName ifAbsent: absentBlock [

	^ self registrationForClassNamed: aClassName ifPresent: [ :registration | ^ registration ] ifAbsent: absentBlock
]

{ #category : 'registration' }
MetacelloProjectRegistry >> registrationForClassNamed: aClassName ifPresent: aBlock ifAbsent: absentBlock [

	^ self projectSpecsRegistry
		  at: (self baselineNameFrom: aClassName)
		  ifPresent: aBlock
		  ifAbsent: absentBlock value
]

{ #category : 'accessing' }
MetacelloProjectRegistry >> registrations [

	^ self projectSpecsRegistry values
]

{ #category : 'registration' }
MetacelloProjectRegistry >> unregisterProjectRegistration: aMetacelloProjectRegistration [

	self projectSpecsRegistry removeKey: aMetacelloProjectRegistration projectSpec className ifAbsent: [ self error: 'unexpectedly missing project registration' ]
]
