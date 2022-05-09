"
A DCExamplesTest is a test class for testing the behavior of DCExamples
"
Class {
	#name : #DCExamplesTest,
	#superclass : #TestCase,
	#instVars : [
		'class',
		'instance',
		'examplesToRun'
	],
	#category : #'DataChart-Tests-Examples'
}

{ #category : #running }
DCExamplesTest >> setUp [
	super setUp.
	class := DCExamples.
	instance := class new.
	examplesToRun := class methods select: [ :met | met selector beginsWith: 'example' ]
]

{ #category : #'basic tests' }
DCExamplesTest >> testsCheckPargmaExamples [
	|  violating |
	violating := examplesToRun reject: [ :met | met hasPragmaNamed: 'script:' ].
	self assert: violating isEmpty description: 'You need to put the script pragma in your code'.
	
]

{ #category : #'basic tests' }
DCExamplesTest >> testsRunAllExamples [
	| violating |
	violating := OrderedCollection new.
	examplesToRun do: [ :met |
		[ | window |
			window := instance perform: met selector.
			window isSystemWindow ifFalse: [ 
				violating add: met.
				 ].
			window delete.
			] onErrorDo: [:ex | 
			violating add: met.
		].
	].
	self assert: examplesToRun isNotEmpty description: 'You should have examples'.
	self assert: violating isEmpty description: 'All the examples should run'.
	
]
