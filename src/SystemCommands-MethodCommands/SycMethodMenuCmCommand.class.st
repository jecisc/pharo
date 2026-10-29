"
I am a Commander2 hybrid for the method commands that show in the full browser method menus. I sit under the v1 SycMethodCommand and keep its legacy lifecycle for the shortcuts, while menus run my subclasses through the Commander2 contract. I am removed together with Commander v1.
"
Class {
	#name : 'SycMethodMenuCmCommand',
	#superclass : 'SycMethodCommand',
	#category : 'SystemCommands-MethodCommands',
	#package : 'SystemCommands-MethodCommands'
}

{ #category : 'execution' }
SycMethodMenuCmCommand >> prepareFullExecution [

	methods := self context selectedMethods
]
