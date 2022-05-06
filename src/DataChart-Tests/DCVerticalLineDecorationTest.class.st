"
A DCVerticalLineDecorationTest is a test class for testing the behavior of DCVerticalLineDecoration
"
Class {
	#name : #DCVerticalLineDecorationTest,
	#superclass : #TestCase,
	#category : #'DataChart-Tests-Decoration'
}

{ #category : #tests }
DCVerticalLineDecorationTest >> testBasic [
	| line |
	line := DCVerticalLineDecoration new.
	self assert: line shape class equals: RSLine.
	self assert: line shape startPoint equals: 0@0.
	self assert: line shape endPoint equals: 0@100.
]

{ #category : #tests }
DCVerticalLineDecorationTest >> testSetter [
	| line |
	line := DCVerticalLineDecoration new.
	line x:100.
	self assert: line shape startPoint equals: 100@0.
	self assert: line shape endPoint equals: 100@100.
]
