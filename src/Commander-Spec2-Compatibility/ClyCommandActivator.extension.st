Extension { #name : 'ClyCommandActivator' }

{ #category : '*Commander-Spec2-Compatibility' }
ClyCommandActivator >> getShortcutTipForMenuItem [

	ClyShortcutActivation
		activeInstancesFor: self command class
		inContext: self context
		do: [ :shortcut | "this is trick to show shortcut on menu with existing menu support" ^ shortcut keyCombination ].
	^ nil
]

{ #category : '*Commander-Spec2-Compatibility' }
ClyCommandActivator >> help [
	^ self command class defaultHelp
]
