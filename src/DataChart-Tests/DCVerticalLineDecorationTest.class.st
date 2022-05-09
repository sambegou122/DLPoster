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
]

{ #category : #tests }
DCVerticalLineDecorationTest >> testRenderIn [
	| line x plot decoration |
	decoration := DCVerticalLineDecoration new.
	decoration x: 100.
	x := 1 to: 100.
	plot := DCLinePlot new
		x: x;
		y: (x raisedTo: 2);
		title: 'DCLinePlot';
		xlabel: 'line x';
		ylabel: 'line y';
		add: decoration;
		build;
		yourself.
	self assert: plot settings decorations size equals: 1.
	self assert: decoration createdShapes size equals: 1.
	line := decoration createdShapes first.
	self assert: line class equals: RSLine.
	self assert: line startPoint x equals: (plot kind scalePoint: decoration x @ 0) x.
	
]

{ #category : #tests }
DCVerticalLineDecorationTest >> testSetter [
	| line |

	line := DCVerticalLineDecoration new.
	line x: 100.
	self assert: line x equals: 100.
]
