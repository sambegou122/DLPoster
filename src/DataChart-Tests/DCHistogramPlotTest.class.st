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
DCHistogramPlotTest >> testAddValues [
	plot x: y.
	plot build.
	self assert: plot x size equals: x size.
]

{ #category : #initialization }
DCHistogramPlotTest >> testAddValuesError [
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
DCHistogramPlotTest >> testBinSize [
	plot x: y.
	plot binSize: 100.
	plot build.
]

{ #category : #initialization }
DCHistogramPlotTest >> testBuild [

	self assert: plot kind class equals: RSHistogramPlot.
	plot 
		x: x;
		build.
	self assert: plot mainShapes first class equals: RSBox.
]

{ #category : #initialization }
DCHistogramPlotTest >> testNoValues [
	self should: [ plot build ] raise:  Error.
]

{ #category : #initialization }
DCHistogramPlotTest >> testNumberOfBins [
	self assert: plot numberOfBins equals: 10.
	self assert: plot bins isNil.
	
	plot x: y.
	plot numberOfBins: 5.
	plot build.
	self assert: plot numberOfBins equals: 5.
	self assert: plot bins size equals: 6.
	self assert: plot kind bars size equals: 5.
]
