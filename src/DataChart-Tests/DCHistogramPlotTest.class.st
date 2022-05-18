"
A DCHistogramPlotTest is a test class for testing the behavior of DCHistogramPlot
"
Class {
	#name : #DCHistogramPlotTest,
	#superclass : #TestCase,
	#instVars : [
		'plot',
		'x',
		'y'
	],
	#category : #'DataChart-Tests-Core'
}

{ #category : #initialization }
DCHistogramPlotTest >> setUp [
	super setUp.
	plot := DCHistogramPlot new.
	x := 1 to: 100.
	y := ( x raisedTo: 2).
	"Put here a common initialization logic for tests"
]

{ #category : #initialization }
DCHistogramPlotTest >> testAddAxis [ 
	
	plot x: x.
	self assert: plot bins isEmpty.
	self assert: plot x size equals: x size.
	plot bins: y.
	self assert: plot bins isNotEmpty.
	self assert: plot bins equals: y.
]

{ #category : #initialization }
DCHistogramPlotTest >> testAddAxisError [
	self should: [ plot y: y ] raise:  Error.
]

{ #category : #initialization }
DCHistogramPlotTest >> testBasic [

	self assert: plot settings class equals: DCPlotSettings.
	self assert: plot x isNil.
	self assert: plot y isNil.
	self assert: plot chart class equals: RSChart.
]

{ #category : #initialization }
DCHistogramPlotTest >> testBuild [

	self assert: plot kind class equals: RSHistogramPlot.
	plot 
		x: x;
		build.
	self assert: plot mainShapes first class equals: RSBox.
]
