"
A DCLabelDecorationTest is a test class for testing the behavior of DCLabelDecoration
"
Class {
	#name : #DCLabelDecorationTest,
	#superclass : #TestCase,
	#category : #'DataChart-Tests-Decoration'
}

{ #category : #tests }
DCLabelDecorationTest >> testBasic [ 
	|label |
	label := DCLabelDecoration new.
	self assert: label shape class equals: RSLabel.
	self assert: label text isNil.
	
]

{ #category : #tests }
DCLabelDecorationTest >> testSetter [ 
	|label |
	label := DCLabelDecoration new
	text: 'Invasion of Ukraine';
	x: 55.5;
	y: 100;
	yourself.
	
	self assert: label x equals: 55.5.
	self assert: label y equals: 100.
]
