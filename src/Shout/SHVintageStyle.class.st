"
I am a style from an old theme.
"
Class {
	#name : #SHVintageStyle,
	#superclass : #SHStyle,
	#category : #'Shout-Styling'
}

{ #category : #accessing }
SHVintageStyle class >> stylerName [
	^ #vintageStyleTable
]

{ #category : #style }
SHVintageStyle >> argument [
	<shoutStyle: #argument>
	^ { (TextColor color: Color blue muchDarker) }
]

{ #category : #style }
SHVintageStyle >> block [
	<shoutStyle: #block>
	^ { (TextColor color: Color black) }
]

{ #category : #style }
SHVintageStyle >> block1 [
	<shoutStyle: #block1>
	^ { (TextColor color: Color green muchDarker) }
]

{ #category : #style }
SHVintageStyle >> block2 [
	<shoutStyle: #block2>
	^ { (TextColor color: Color magenta muchDarker) }
]

{ #category : #style }
SHVintageStyle >> block3 [
	<shoutStyle: #block3>
	^ { (TextColor color: Color red muchDarker) }
]

{ #category : #style }
SHVintageStyle >> block4 [
	<shoutStyle: #block4>
	^ { (TextColor color: Color green darker) }
]

{ #category : #style }
SHVintageStyle >> block5 [
	<shoutStyle: #block5>
	^ { (TextColor color: Color orange darker) }
]

{ #category : #style }
SHVintageStyle >> block6 [
	<shoutStyle: #block6>
	^ { (TextColor color: Color magenta darker) }
]

{ #category : #style }
SHVintageStyle >> block7 [
	<shoutStyle: #block7>
	^ { (TextColor color: Color blue) }
]

{ #category : #style }
SHVintageStyle >> blockArg [
	<shoutStyle: #blockArg>
	^ { (TextColor color: Color blue muchDarker) }
]

{ #category : #style }
SHVintageStyle >> blockArgColon [
	<shoutStyle: #blockArgColon>
	^ { (TextColor color: Color black) }
]

{ #category : #style }
SHVintageStyle >> blockArgsBar [
	<shoutStyle: #blockArgsBar>
	^ { (TextColor color: Color black) }
]

{ #category : #style }
SHVintageStyle >> blockPatternArg [
	<shoutStyle: #blockPatternArg>
	^ { (TextColor color: Color blue muchDarker) }
]

{ #category : #style }
SHVintageStyle >> blockPatternTempVar [
	<shoutStyle: #blockPatternTempVar>
	^ { (TextColor color: Color blue muchDarker) }
]

{ #category : #style }
SHVintageStyle >> blockTempBar [
	<shoutStyle: #blockTempBar>
	^ { (TextColor color: Color black) }
]

{ #category : #style }
SHVintageStyle >> blockTempVar [
	<shoutStyle: #blockTempVar>
	^ { (TextColor color: Color blue muchDarker) }
]

{ #category : #style }
SHVintageStyle >> brace [
	<shoutStyle: #brace>
	^ { (TextColor color: Color black) }
]

{ #category : #style }
SHVintageStyle >> brace1 [
	<shoutStyle: #brace1>
	^ { (TextColor color: Color green muchDarker) }
]

{ #category : #style }
SHVintageStyle >> brace2 [
	<shoutStyle: #brace2>
	^ { (TextColor color: Color magenta muchDarker) }
]

{ #category : #style }
SHVintageStyle >> brace3 [
	<shoutStyle: #brace3>
	^ { (TextColor color: Color red muchDarker) }
]

{ #category : #style }
SHVintageStyle >> brace4 [
	<shoutStyle: #brace4>
	^ { (TextColor color: Color green darker) }
]

{ #category : #style }
SHVintageStyle >> brace5 [
	<shoutStyle: #brace5>
	^ { (TextColor color: Color orange darker) }
]

{ #category : #style }
SHVintageStyle >> brace6 [
	<shoutStyle: #brace6>
	^ { (TextColor color: Color magenta darker) }
]

{ #category : #style }
SHVintageStyle >> brace7 [
	<shoutStyle: #brace7>
	^ { (TextColor color: Color blue) }
]

{ #category : #style }
SHVintageStyle >> cascadeSeparator [
	<shoutStyle: #cascadeSeparator>
	^ { (TextColor color: Color black)  . TextEmphasis bold }
]

{ #category : #style }
SHVintageStyle >> character [
	<shoutStyle: #character>
	^ { (TextColor color: (Color colorFrom: #('801f91' #lighter))) }
]

{ #category : #style }
SHVintageStyle >> classVar [
	<shoutStyle: #classVar>
	^ { (TextColor color: Color blue muchDarker)  . TextEmphasis bold }
]

{ #category : #style }
SHVintageStyle >> comment [
	<shoutStyle: #comment>
	^ { (TextColor color: (Color colorFrom: '006400')) }
]

{ #category : #style }
SHVintageStyle >> default [
	<shoutStyle: #default>
	^ { (TextColor color: Color black) }
]

{ #category : #style }
SHVintageStyle >> false [
	<shoutStyle: #false>
	^ { (TextColor color: (Color colorFrom: #('A31515' #darker))) }
]

{ #category : #style }
SHVintageStyle >> globalVar [
	<shoutStyle: #globalVar>
	^ { (TextColor color: Color black)  . TextEmphasis bold }
]

{ #category : #style }
SHVintageStyle >> incompleteIdentifier [
	<shoutStyle: #incompleteIdentifier>
	^ { (TextColor color: Color blue)  . TextEmphasis italic }
]

{ #category : #style }
SHVintageStyle >> incompleteSelector [
	<shoutStyle: #incompleteSelector>
	^ { (TextColor color: Color blue)  . TextEmphasis italic }
]

{ #category : #style }
SHVintageStyle >> instVar [
	<shoutStyle: #instVar>
	^ { (TextColor color: Color blue muchDarker) }
]

{ #category : #style }
SHVintageStyle >> invalid [
	<shoutStyle: #invalid>
	^ { (TextColor color: Color red) }
]

{ #category : #style }
SHVintageStyle >> methodTempBar [
	<shoutStyle: #methodTempBar>
	^ { (TextColor color: Color black) }
]

{ #category : #style }
SHVintageStyle >> nil [
	<shoutStyle: #nil>
	^ { (TextColor color: (Color colorFrom: #('A31515' #darker))) }
]

{ #category : #style }
SHVintageStyle >> number [
	<shoutStyle: #number>
	^ { (TextColor color: (Color colorFrom: #('801f91'))) }
]

{ #category : #style }
SHVintageStyle >> parenthesis [
	<shoutStyle: #parenthesis>
	^ { (TextColor color: Color black) }
]

{ #category : #style }
SHVintageStyle >> parenthesis1 [
	<shoutStyle: #parenthesis1>
	^ { (TextColor color: Color green muchDarker) }
]

{ #category : #style }
SHVintageStyle >> parenthesis2 [
	<shoutStyle: #parenthesis2>
	^ { (TextColor color: Color magenta muchDarker) }
]

{ #category : #style }
SHVintageStyle >> parenthesis3 [
	<shoutStyle: #parenthesis3>
	^ { (TextColor color: Color red muchDarker) }
]

{ #category : #style }
SHVintageStyle >> parenthesis4 [
	<shoutStyle: #parenthesis4>
	^ { (TextColor color: Color green darker) }
]

{ #category : #style }
SHVintageStyle >> parenthesis5 [
	<shoutStyle: #parenthesis5>
	^ { (TextColor color: Color orange darker) }
]

{ #category : #style }
SHVintageStyle >> parenthesis6 [
	<shoutStyle: #parenthesis6>
	^ { (TextColor color: Color magenta darker) }
]

{ #category : #style }
SHVintageStyle >> parenthesis7 [
	<shoutStyle: #parenthesis7>
	^ { (TextColor color: Color blue) }
]

{ #category : #style }
SHVintageStyle >> patternArg [
	<shoutStyle: #patternArg>
	^ { (TextColor color: Color blue muchDarker) }
]

{ #category : #style }
SHVintageStyle >> patternSelector [
	<shoutStyle: #patternSelector>
	^ {  . TextEmphasis bold }
]

{ #category : #style }
SHVintageStyle >> patternTempVar [
	<shoutStyle: #patternTempVar>
	^ { (TextColor color: Color blue muchDarker) }
]

{ #category : #style }
SHVintageStyle >> poolConstant [
	<shoutStyle: #poolConstant>
	^ { (TextColor color: Color blue muchDarker)  . TextEmphasis bold }
]

{ #category : #style }
SHVintageStyle >> pragma [
	<shoutStyle: #pragma>
	^ { (TextColor color: Color cyan muchDarker) }
]

{ #category : #style }
SHVintageStyle >> return [
	<shoutStyle: #return>
	^ { (TextColor color: (Color colorFrom: 'A31515'))  . TextEmphasis bold }
]

{ #category : #style }
SHVintageStyle >> selector [
	<shoutStyle: #selector>
	^ { (TextColor color: Color black) }
]

{ #category : #style }
SHVintageStyle >> self [
	<shoutStyle: #self>
	^ { (TextColor color: (Color colorFrom: 'A31515')) }
]

{ #category : #style }
SHVintageStyle >> statementSeparator [
	<shoutStyle: #statementSeparator>
	^ { (TextColor color: Color black)  . TextEmphasis bold }
]

{ #category : #style }
SHVintageStyle >> string [
	<shoutStyle: #string>
	^ { (TextColor color: (Color colorFrom: #('801f91'))) }
]

{ #category : #style }
SHVintageStyle >> super [
	<shoutStyle: #super>
	^ { (TextColor color: (Color colorFrom: 'A31515')) }
]

{ #category : #style }
SHVintageStyle >> symbol [
	<shoutStyle: #symbol>
	^ { (TextColor color: (Color colorFrom: #('801f91'))) }
]

{ #category : #style }
SHVintageStyle >> tempVar [
	<shoutStyle: #tempVar>
	^ { (TextColor color: Color blue muchDarker) }
]

{ #category : #style }
SHVintageStyle >> thisContext [
	<shoutStyle: #thisContext>
	^ { (TextColor color: (Color colorFrom: 'A31515')) }
]

{ #category : #style }
SHVintageStyle >> true [
	<shoutStyle: #true>
	^ { (TextColor color: (Color colorFrom: #('A31515' #darker))) }
]

{ #category : #style }
SHVintageStyle >> undefinedIdentifier [
	<shoutStyle: #undefinedIdentifier>
	^ { (TextColor color: Color red) }
]

{ #category : #style }
SHVintageStyle >> undefinedSelector [
	<shoutStyle: #undefinedSelector>
	^ { (TextColor color: Color red) }
]
