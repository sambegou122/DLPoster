Class {
	#name : #LinePlotTest,
	#superclass : #TestCase,
	#instVars : [
		'window'
	],
	#category : #'DataChart-Tests-Plots'
}

{ #category : #tests }
LinePlotTest >> testAccessingShapes [
	| x line1 shape |

	x := 0.0 to: 2 count: 100.

	line1 := LinePlot new
		x: x;
		y: (x raisedTo: 2);
		yourself.
	line1 build.
	shape := line1 line.
	self assert: shape class equals: RSPolyline.

]

{ #category : #tests }
LinePlotTest >> testBasicLinePlot [
	| x line1 shapes |

	x := 0.0 to: 2 count: 100.

	line1 := LinePlot new
		x: x;
		y: (x raisedTo: 2);
		yourself.
	window := line1 show.
	shapes := line1 canvas shapes select: [ :shape| shape class = RSPolyline ].
	self assert: shapes size equals: 1.

]
