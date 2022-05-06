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
	| line point xPoint yPoint |

	line := DCVerticalLineDecoration new.
	line x: 100.
	point := 100 * 3.
	xPoint := point @ 0.
	yPoint := point @ (-200).
	self assert: line shape startPoint equals: yPoint.
	self assert: line shape endPoint equals: xPoint.
]
