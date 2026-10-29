"
I am a Commander2 hybrid for the method group (protocol) commands that show in the full browser protocol pane. I sit under the v1 ClyMethodGroupCommand and keep its legacy lifecycle for the shortcuts, while menus run my subclasses through the Commander2 contract. I am removed together with Commander v1.
"
Class {
	#name : 'ClyMethodGroupMenuCmCommand',
	#superclass : 'ClyMethodGroupCommand',
	#category : 'Calypso-SystemTools-FullBrowser',
	#package : 'Calypso-SystemTools-FullBrowser'
}

{ #category : 'execution' }
ClyMethodGroupMenuCmCommand >> prepareFullExecution [

	methodGroups := self context selectedMethodGroups
]
