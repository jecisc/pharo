*OpalCompiler-Core
mustBeBooleanInMagic: context
	"Permits to redefine methods inlined by compiler.
	Take the ast node corresponding to the mustBeBoolean error, compile it on the with Opal fly and executes it as a DoIt. Then resume the execution of the context."

	| sendNode methodNode method |

	"get the message send node that triggered mustBeBoolean"
	sendNode := context sourceNode sourceNodeForPC: context pc - 1.
	"Build node to perform send unoptimized"
	methodNode := RBMethodNode 
		selector: #ExecuteUnOptimizedIn: 
		arguments: { RBVariableNode named:'ThisContext' } 
		body: sendNode copy asSequenceNode.
	"Rewrite temps to access the values in context"
	methodNode rewriteTempsForContext: context.
	"Rewrite non-local returns to return to the correct context from send"
	RBParseTreeRewriter new 
		replace: '^ ``@value' with: 'ThisContext home return: ``@value';
		executeTree: methodNode.
	"Add a return to the method body"
	methodNode body transformLastToReturn.	
	"Keep same compilation context as the sender node's"
	methodNode compilationContext: sendNode methodNode compilationContext copy.
	"Disable inlining so the message send will be unoptimized"
	methodNode compilationContext compilerOptions: #(- optionInlineIf optionInlineAndOr optionInlineWhile).
	"Generate the method"	
	method := methodNode generate.
	"resume the context at the instruction following the send when returning from deoptimized code"
	context pc: sendNode irInstruction nextBytecodeOffsetAfterJump.
	"Execute the generated method"
	^ context receiver withArgs: {context} executeMethod: method