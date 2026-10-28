Extension { #name : 'ClyMenu' }

{ #category : '*Commander-Spec2-Compatibility' }
ClyMenu >> asSpMenuPresenter [

	| menu |
	menu := SpMenuPresenter new.
	self rootGroup contents do: [ :each | each addToMenuPresenter: menu ].
	^ menu
]
