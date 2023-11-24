"
I am a basic session manager that does not manages a startup and shut down list of actions.

My goal is to be used at the beginning of the bootstrap until we have the full `SessionManager` loaded. I just take care of launching and shuting down the image.
"
Class {
	#name : 'BasicSessionManager',
	#superclass : 'Object',
	#category : 'System-Support-Image',
	#package : 'System-Support',
	#tag : 'Image'
}

{ #category : 'accessing' }
BasicSessionManager class >> default [
	"No need for a singleton here"

	^ self new
]

{ #category : 'accessing' }
BasicSessionManager >> currentSession [
	"I am too basic to manage a session."

	^ nil
]

{ #category : 'accessing' }
BasicSessionManager >> installNewSession [
	"I do not manage this, only my subclass does."

	
]

{ #category : 'snapshot and quit' }
BasicSessionManager >> launchSnapshot: save andQuit: quit [

	| isImageStarting snapshotResult |
	ChangesLog default logSnapshot: save andQuit: quit.

	self currentSession
		ifNil: [ { Delay. NonInteractiveTranscript } do: [:class | class shutDown: quit ] ]
		ifNotNil: [ :session | session stop: quit ]. "Image not usable from here until the session is restarted!"
	save
		ifTrue: [
			snapshotResult := Smalltalk snapshotPrimitive. "<-- PC frozen here on image file"
			isImageStarting := snapshotResult == true ]
		ifFalse: [ isImageStarting := false ].
	(quit and: [ isImageStarting not ]) ifTrue: [ Smalltalk quitPrimitive ].

	"create a new session object if we're booting"
	isImageStarting ifTrue: [ self installNewSession ].

	self currentSession
		ifNil: [
			isImageStarting ifTrue: [ "In case we don't have the SessionManager in the image we still want to be able to execute basic command lines."
				{ SmallInteger. Delay. ProcessorScheduler . OSPlatform . ExternalObject . FFIBackend . File . NonInteractiveTranscript . FinalizationProcess . Stdio . SharedRandom . EndianDetector . Symbol } do: [:class | class startUp: isImageStarting ].
				BasicCommandLineHandler new activate ] ]
		ifNotNil: [ :session | session start: isImageStarting ].
	snapshotResult
		ifNil: [ self error: 'Failed to write image file (disk full?)' ]
		ifNotNil: [ "This branch should be removed in Pharo 13 with the deprecated announcement."
			self class environment at: #SnapshotDone ifPresent: [ :class | self class codeSupportAnnouncer announce: (class isNewImage: isImageStarting) ] ].

	"We return the resuming state, which may be useful for users to know the state of the image"
	^ isImageStarting
]

{ #category : 'snapshot and quit' }
BasicSessionManager >> snapshot: save andQuit: quit [

	| isImageStarting wait |
	"We do the snapshot in a separate process in maximum priority to have always a clean startup.
	This process will be interrupted by the fork, and will be resumed as soon as the snapshot finishes.
	We synchronize these processes in case both are in the same priority.
	When both arguments are false, do nothing and return false."
	(save or: [ quit ]) ifFalse: [ ^ false ].
	wait := Semaphore new.
	[
	isImageStarting := self launchSnapshot: save andQuit: quit.
	wait signal ] forkAt: Processor timingPriority - 1.
	wait wait.

	"The execution of the deferred startup actions are executed in the caller thread."
	self currentSession ifNotNil: [ :session | session executeDeferredStartupActions: isImageStarting ].

	^ isImageStarting
]
