Class {
	#name : #SHDarkStyle,
	#superclass : #SHStyle,
	#category : #'Shout-Styling'
}

{ #category : #accessing }
SHDarkStyle class >> stylerName [

	^ #darkStyleTable
]

{ #category : #style }
SHDarkStyle >> argument [
	<shoutStyle: #argument>
	^ { (TextColor color: (Color colorFrom: 'A7E2ED')) }
]

{ #category : #style }
SHDarkStyle >> block [
	<shoutStyle: #block>
	^ { (TextColor color: Color white) }
]

{ #category : #style }
SHDarkStyle >> block1 [
	<shoutStyle: #block1>
	^ { (TextColor color: Color green muchLighter) }
]

{ #category : #style }
SHDarkStyle >> block2 [
	<shoutStyle: #block2>
	^ { (TextColor color: Color magenta muchLighter) }
]

{ #category : #style }
SHDarkStyle >> block3 [
	<shoutStyle: #block3>
	^ { (TextColor color: Color red muchLighter) }
]

{ #category : #style }
SHDarkStyle >> block4 [
	<shoutStyle: #block4>
	^ { (TextColor color: Color green lighter) }
]

{ #category : #style }
SHDarkStyle >> block5 [
	<shoutStyle: #block5>
	^ { (TextColor color: Color orange lighter) }
]

{ #category : #style }
SHDarkStyle >> block6 [
	<shoutStyle: #block6>
	^ { (TextColor color: Color magenta lighter) }
]

{ #category : #style }
SHDarkStyle >> block7 [
	<shoutStyle: #block7>
	^ { (TextColor color: Color blue) }
]

{ #category : #style }
SHDarkStyle >> blockArg [
	<shoutStyle: #blockArg>
	^ { (TextColor color: (Color colorFrom: 'A7E2ED'))  . TextEmphasis italic }
]

{ #category : #style }
SHDarkStyle >> blockArgColon [
	<shoutStyle: #blockArgColon>
	^ { (TextColor color: Color white) }
]

{ #category : #style }
SHDarkStyle >> blockArgsBar [
	<shoutStyle: #blockArgsBar>
	^ { (TextColor color: Color white) }
]

{ #category : #style }
SHDarkStyle >> blockPatternArg [
	<shoutStyle: #blockPatternArg>
	^ { (TextColor color: (Color colorFrom: 'A7E2ED'))  . TextEmphasis italic }
]

{ #category : #style }
SHDarkStyle >> blockPatternTempVar [
	<shoutStyle: #blockPatternTempVar>
	^ { (TextColor color: (Color colorFrom: 'A7E2ED')) }
]

{ #category : #style }
SHDarkStyle >> blockTempBar [
	<shoutStyle: #blockTempBar>
	^ { (TextColor color: Color white) }
]

{ #category : #style }
SHDarkStyle >> blockTempVar [
	<shoutStyle: #blockTempVar>
	^ { (TextColor color: (Color colorFrom: 'A7E2ED')) }
]

{ #category : #style }
SHDarkStyle >> brace [
	<shoutStyle: #brace>
	^ { (TextColor color: Color white) }
]

{ #category : #style }
SHDarkStyle >> brace1 [
	<shoutStyle: #brace1>
	^ { (TextColor color: Color green muchLighter) }
]

{ #category : #style }
SHDarkStyle >> brace2 [
	<shoutStyle: #brace2>
	^ { (TextColor color: Color magenta muchLighter) }
]

{ #category : #style }
SHDarkStyle >> brace3 [
	<shoutStyle: #brace3>
	^ { (TextColor color: Color red muchLighter) }
]

{ #category : #style }
SHDarkStyle >> brace4 [
	<shoutStyle: #brace4>
	^ { (TextColor color: Color green lighter) }
]

{ #category : #style }
SHDarkStyle >> brace5 [
	<shoutStyle: #brace5>
	^ { (TextColor color: Color orange lighter) }
]

{ #category : #style }
SHDarkStyle >> brace6 [
	<shoutStyle: #brace6>
	^ { (TextColor color: Color magenta lighter) }
]

{ #category : #style }
SHDarkStyle >> brace7 [
	<shoutStyle: #brace7>
	^ { (TextColor color: Color blue) }
]

{ #category : #style }
SHDarkStyle >> cascadeSeparator [
	<shoutStyle: #cascadeSeparator>
	^ { (TextColor color: Color white)  . TextEmphasis bold }
]

{ #category : #style }
SHDarkStyle >> character [
	<shoutStyle: #character>
	^ { (TextColor color: (Color colorFrom: #('E38C1E' #lighter))) }
]

{ #category : #style }
SHDarkStyle >> classVar [
	<shoutStyle: #classVar>
	^ { (TextColor color: (Color colorFrom: 'A7E2ED'))  . TextEmphasis bold }
]

{ #category : #style }
SHDarkStyle >> comment [
	<shoutStyle: #comment>
	^ { (TextColor color: (Color colorFrom: '7D8C93')) }
]

{ #category : #style }
SHDarkStyle >> default [
	<shoutStyle: #default>
	^ { (TextColor color: Color white) }
]

{ #category : #style }
SHDarkStyle >> false [
	<shoutStyle: #false>
	^ { (TextColor color: (Color colorFrom: #('00CC6E' #darker))) }
]

{ #category : #style }
SHDarkStyle >> globalVar [
	<shoutStyle: #globalVar>
	^ { (TextColor color: Color white)  . TextEmphasis bold }
]

{ #category : #style }
SHDarkStyle >> incompleteIdentifier [
	<shoutStyle: #incompleteIdentifier>
	^ { (TextColor color: (Color colorFrom: 'E8E2B7'))  . TextEmphasis italic }
]

{ #category : #style }
SHDarkStyle >> incompleteSelector [
	<shoutStyle: #incompleteSelector>
	^ { (TextColor color: (Color colorFrom: 'E8E2B7'))  . TextEmphasis italic }
]

{ #category : #style }
SHDarkStyle >> instVar [
	<shoutStyle: #instVar>
	^ { (TextColor color: (Color colorFrom: 'A7E2ED')) }
]

{ #category : #style }
SHDarkStyle >> invalid [
	<shoutStyle: #invalid>
	^ { (TextColor color: (Color colorFrom: 'FF8A80')) }
]

{ #category : #style }
SHDarkStyle >> methodTempBar [
	<shoutStyle: #methodTempBar>
	^ { (TextColor color: Color white) }
]

{ #category : #style }
SHDarkStyle >> nil [
	<shoutStyle: #nil>
	^ { (TextColor color: (Color colorFrom: #('00CC6E' #darker))) }
]

{ #category : #style }
SHDarkStyle >> number [
	<shoutStyle: #number>
	^ { (TextColor color: (Color colorFrom: #('FFE54B'))) }
]

{ #category : #style }
SHDarkStyle >> parenthesis [
	<shoutStyle: #parenthesis>
	^ { (TextColor color: Color white) }
]

{ #category : #style }
SHDarkStyle >> parenthesis1 [
	<shoutStyle: #parenthesis1>
	^ { (TextColor color: Color green muchLighter) }
]

{ #category : #style }
SHDarkStyle >> parenthesis2 [
	<shoutStyle: #parenthesis2>
	^ { (TextColor color: Color magenta muchLighter) }
]

{ #category : #style }
SHDarkStyle >> parenthesis3 [
	<shoutStyle: #parenthesis3>
	^ { (TextColor color: (Color colorFrom: #('FF8A80' #muchLighter))) }
]

{ #category : #style }
SHDarkStyle >> parenthesis4 [
	<shoutStyle: #parenthesis4>
	^ { (TextColor color: Color green lighter) }
]

{ #category : #style }
SHDarkStyle >> parenthesis5 [
	<shoutStyle: #parenthesis5>
	^ { (TextColor color: Color orange lighter) }
]

{ #category : #style }
SHDarkStyle >> parenthesis6 [
	<shoutStyle: #parenthesis6>
	^ { (TextColor color: Color magenta lighter) }
]

{ #category : #style }
SHDarkStyle >> parenthesis7 [
	<shoutStyle: #parenthesis7>
	^ { (TextColor color: Color blue) }
]

{ #category : #style }
SHDarkStyle >> patternArg [
	<shoutStyle: #patternArg>
	^ { (TextColor color: (Color colorFrom: 'A7E2ED')) }
]

{ #category : #style }
SHDarkStyle >> patternSelector [
	<shoutStyle: #patternSelector>
	^ {  . TextEmphasis bold }
]

{ #category : #style }
SHDarkStyle >> patternTempVar [
	<shoutStyle: #patternTempVar>
	^ { (TextColor color: (Color colorFrom: 'A7E2ED')) }
]

{ #category : #style }
SHDarkStyle >> poolConstant [
	<shoutStyle: #poolConstant>
	^ { (TextColor color: (Color colorFrom: 'A7E2ED'))  . TextEmphasis bold }
]

{ #category : #style }
SHDarkStyle >> pragma [
	<shoutStyle: #pragma>
	^ { (TextColor color: (Color colorFrom: 'B4DD6E')) }
]

{ #category : #style }
SHDarkStyle >> return [
	<shoutStyle: #return>
	^ { (TextColor color: (Color colorFrom: '00CC6E'))  . TextEmphasis bold }
]

{ #category : #style }
SHDarkStyle >> selector [
	<shoutStyle: #selector>
	^ { (TextColor color: Color white) }
]

{ #category : #style }
SHDarkStyle >> self [
	<shoutStyle: #self>
	^ { (TextColor color: (Color colorFrom: '00CC6E')) }
]

{ #category : #style }
SHDarkStyle >> statementSeparator [
	<shoutStyle: #statementSeparator>
	^ { (TextColor color: Color white)  . TextEmphasis bold }
]

{ #category : #style }
SHDarkStyle >> string [
	<shoutStyle: #string>
	^ { (TextColor color: (Color colorFrom: #('E38C1E'))) }
]

{ #category : #style }
SHDarkStyle >> super [
	<shoutStyle: #super>
	^ { (TextColor color: (Color colorFrom: '00CC6E')) }
]

{ #category : #style }
SHDarkStyle >> symbol [
	<shoutStyle: #symbol>
	^ { (TextColor color: (Color colorFrom: #('E38C1E'))) }
]

{ #category : #style }
SHDarkStyle >> tempVar [
	<shoutStyle: #tempVar>
	^ { (TextColor color: (Color colorFrom: 'A7E2ED')) }
]

{ #category : #style }
SHDarkStyle >> thisContext [
	<shoutStyle: #thisContext>
	^ { (TextColor color: (Color colorFrom: '00CC6E')) }
]

{ #category : #style }
SHDarkStyle >> true [
	<shoutStyle: #true>
	^ { (TextColor color: (Color colorFrom: #('00CC6E' #darker))) }
]

{ #category : #style }
SHDarkStyle >> undefinedIdentifier [
	<shoutStyle: #undefinedIdentifier>
	^ { (TextColor color: (Color colorFrom: 'FF8A80')) }
]

{ #category : #style }
SHDarkStyle >> undefinedSelector [
	<shoutStyle: #undefinedSelector>
	^ { (TextColor color: (Color colorFrom: 'FF8A80')) }
]
