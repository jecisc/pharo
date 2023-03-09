"
I am the default style of Pharo Light Theme.
"
Class {
	#name : #SHBlueStyle,
	#superclass : #SHStyle,
	#category : #'Shout-Styling'
}

{ #category : #accessing }
SHBlueStyle class >> stylerName [

	^ #blueStyleTable
]

{ #category : #style }
SHBlueStyle >> argument [
	<shoutStyle: #argument>
	^ { (TextColor color: Color blue muchDarker) }
]

{ #category : #style }
SHBlueStyle >> block [
	<shoutStyle: #block>
	^ { (TextColor color: Color black) }
]

{ #category : #style }
SHBlueStyle >> block1 [
	<shoutStyle: #block1>
	^ { (TextColor color: Color green muchDarker) }
]

{ #category : #style }
SHBlueStyle >> block2 [
	<shoutStyle: #block2>
	^ { (TextColor color: Color magenta muchDarker) }
]

{ #category : #style }
SHBlueStyle >> block3 [
	<shoutStyle: #block3>
	^ { (TextColor color: Color red muchDarker) }
]

{ #category : #style }
SHBlueStyle >> block4 [
	<shoutStyle: #block4>
	^ { (TextColor color: Color green darker) }
]

{ #category : #style }
SHBlueStyle >> block5 [
	<shoutStyle: #block5>
	^ { (TextColor color: Color orange darker) }
]

{ #category : #style }
SHBlueStyle >> block6 [
	<shoutStyle: #block6>
	^ { (TextColor color: Color magenta darker) }
]

{ #category : #style }
SHBlueStyle >> block7 [
	<shoutStyle: #block7>
	^ { (TextColor color: Color blue) }
]

{ #category : #style }
SHBlueStyle >> blockArg [
	<shoutStyle: #blockArg>
	^ { (TextColor color: Color blue muchDarker) }
]

{ #category : #style }
SHBlueStyle >> blockArgColon [
	<shoutStyle: #blockArgColon>
	^ { (TextColor color: Color black) }
]

{ #category : #style }
SHBlueStyle >> blockArgsBar [
	<shoutStyle: #blockArgsBar>
	^ { (TextColor color: Color black) }
]

{ #category : #style }
SHBlueStyle >> blockPatternArg [
	<shoutStyle: #blockPatternArg>
	^ { (TextColor color: Color blue muchDarker) }
]

{ #category : #style }
SHBlueStyle >> blockPatternTempVar [
	<shoutStyle: #blockPatternTempVar>
	^ { (TextColor color: Color blue muchDarker) }
]

{ #category : #style }
SHBlueStyle >> blockTempBar [
	<shoutStyle: #blockTempBar>
	^ { (TextColor color: Color black) }
]

{ #category : #style }
SHBlueStyle >> blockTempVar [
	<shoutStyle: #blockTempVar>
	^ { (TextColor color: Color blue muchDarker) }
]

{ #category : #style }
SHBlueStyle >> brace [
	<shoutStyle: #brace>
	^ { (TextColor color: Color black) }
]

{ #category : #style }
SHBlueStyle >> brace1 [
	<shoutStyle: #brace1>
	^ { (TextColor color: Color green muchDarker) }
]

{ #category : #style }
SHBlueStyle >> brace2 [
	<shoutStyle: #brace2>
	^ { (TextColor color: Color magenta muchDarker) }
]

{ #category : #style }
SHBlueStyle >> brace3 [
	<shoutStyle: #brace3>
	^ { (TextColor color: Color red muchDarker) }
]

{ #category : #style }
SHBlueStyle >> brace4 [
	<shoutStyle: #brace4>
	^ { (TextColor color: Color green darker) }
]

{ #category : #style }
SHBlueStyle >> brace5 [
	<shoutStyle: #brace5>
	^ { (TextColor color: Color orange darker) }
]

{ #category : #style }
SHBlueStyle >> brace6 [
	<shoutStyle: #brace6>
	^ { (TextColor color: Color magenta darker) }
]

{ #category : #style }
SHBlueStyle >> brace7 [
	<shoutStyle: #brace7>
	^ { (TextColor color: Color blue) }
]

{ #category : #style }
SHBlueStyle >> cascadeSeparator [
	<shoutStyle: #cascadeSeparator>
	^ { (TextColor color: Color black) }
]

{ #category : #style }
SHBlueStyle >> character [
	<shoutStyle: #character>
	^ { (TextColor color: Color red muchDarker) }
]

{ #category : #style }
SHBlueStyle >> classVar [
	<shoutStyle: #classVar>
	^ { (TextColor color: Color blue muchDarker) }
]

{ #category : #style }
SHBlueStyle >> comment [
	<shoutStyle: #comment>
	^ { (TextColor color: Color gray darker) }
]

{ #category : #style }
SHBlueStyle >> default [
	<shoutStyle: #default>
	^ { (TextColor color: Color black) }
]

{ #category : #style }
SHBlueStyle >> false [
	<shoutStyle: #false>
	^ { (TextColor color: Color red muchDarker) }
]

{ #category : #style }
SHBlueStyle >> globalVar [
	<shoutStyle: #globalVar>
	^ { (TextColor color: Color blue muchDarker) }
]

{ #category : #style }
SHBlueStyle >> incompleteIdentifier [
	<shoutStyle: #incompleteIdentifier>
	^ { (TextColor color: Color blue)  . TextEmphasis italic }
]

{ #category : #style }
SHBlueStyle >> incompleteSelector [
	<shoutStyle: #incompleteSelector>
	^ { TextEmphasis italic }
]

{ #category : #style }
SHBlueStyle >> instVar [
	<shoutStyle: #instVar>
	^ { (TextColor color: Color blue muchDarker) }
]

{ #category : #style }
SHBlueStyle >> invalid [
	<shoutStyle: #invalid>
	^ { (TextColor color: Color red) }
]

{ #category : #style }
SHBlueStyle >> methodTempBar [
	<shoutStyle: #methodTempBar>
	^ { (TextColor color: Color black) }
]

{ #category : #style }
SHBlueStyle >> nil [
	<shoutStyle: #nil>
	^ { (TextColor color: Color red muchDarker) }
]

{ #category : #style }
SHBlueStyle >> number [
	<shoutStyle: #number>
	^ { (TextColor color: Color red muchDarker) }
]

{ #category : #style }
SHBlueStyle >> parenthesis [
	<shoutStyle: #parenthesis>
	^ { (TextColor color: Color black) }
]

{ #category : #style }
SHBlueStyle >> parenthesis1 [
	<shoutStyle: #parenthesis1>
	^ { (TextColor color: Color green muchDarker) }
]

{ #category : #style }
SHBlueStyle >> parenthesis2 [
	<shoutStyle: #parenthesis2>
	^ { (TextColor color: Color magenta muchDarker) }
]

{ #category : #style }
SHBlueStyle >> parenthesis3 [
	<shoutStyle: #parenthesis3>
	^ { (TextColor color: Color red muchDarker) }
]

{ #category : #style }
SHBlueStyle >> parenthesis4 [
	<shoutStyle: #parenthesis4>
	^ { (TextColor color: Color green darker) }
]

{ #category : #style }
SHBlueStyle >> parenthesis5 [
	<shoutStyle: #parenthesis5>
	^ { (TextColor color: Color orange darker) }
]

{ #category : #style }
SHBlueStyle >> parenthesis6 [
	<shoutStyle: #parenthesis6>
	^ { (TextColor color: Color magenta darker) }
]

{ #category : #style }
SHBlueStyle >> parenthesis7 [
	<shoutStyle: #parenthesis7>
	^ { (TextColor color: Color blue) }
]

{ #category : #style }
SHBlueStyle >> patternArg [
	<shoutStyle: #patternArg>
	^ { (TextColor color: Color blue muchDarker) }
]

{ #category : #style }
SHBlueStyle >> patternSelector [
	<shoutStyle: #patternSelector>
	^ { TextEmphasis bold }
]

{ #category : #style }
SHBlueStyle >> patternTempVar [
	<shoutStyle: #patternTempVar>
	^ { (TextColor color: Color blue muchDarker) }
]

{ #category : #style }
SHBlueStyle >> poolConstant [
	<shoutStyle: #poolConstant>
	^ { (TextColor color: Color blue muchDarker) }
]

{ #category : #style }
SHBlueStyle >> pragma [
	<shoutStyle: #pragma>
	^ { (TextColor color: Color green muchDarker) }
]

{ #category : #style }
SHBlueStyle >> return [
	<shoutStyle: #return>
	^ { (TextColor color: Color cyan muchDarker)  . TextEmphasis bold }
]

{ #category : #style }
SHBlueStyle >> selector [
	<shoutStyle: #selector>
	^ { (TextColor color: Color black) }
]

{ #category : #style }
SHBlueStyle >> self [
	<shoutStyle: #self>
	^ { (TextColor color: Color cyan muchDarker) }
]

{ #category : #style }
SHBlueStyle >> statementSeparator [
	<shoutStyle: #statementSeparator>
	^ { (TextColor color: Color black) }
]

{ #category : #style }
SHBlueStyle >> string [
	<shoutStyle: #string>
	^ { (TextColor color: Color magenta muchDarker)  . TextEmphasis normal }
]

{ #category : #style }
SHBlueStyle >> super [
	<shoutStyle: #super>
	^ { (TextColor color: Color cyan muchDarker) }
]

{ #category : #style }
SHBlueStyle >> symbol [
	<shoutStyle: #symbol>
	^ { (TextColor color: Color magenta muchDarker) }
]

{ #category : #style }
SHBlueStyle >> tempVar [
	<shoutStyle: #tempVar>
	^ { (TextColor color: Color blue muchDarker) }
]

{ #category : #style }
SHBlueStyle >> thisContext [
	<shoutStyle: #thisContext>
	^ { (TextColor color: Color cyan muchDarker) }
]

{ #category : #style }
SHBlueStyle >> true [
	<shoutStyle: #true>
	^ { (TextColor color: Color red muchDarker) }
]

{ #category : #style }
SHBlueStyle >> undefinedIdentifier [
	<shoutStyle: #undefinedIdentifier>
	^ { (TextColor color: Color red) }
]

{ #category : #style }
SHBlueStyle >> undefinedSelector [
	<shoutStyle: #undefinedSelector>
	^ { (TextColor color: Color red) }
]
