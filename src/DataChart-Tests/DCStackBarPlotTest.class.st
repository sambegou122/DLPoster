"
A DCStackBarPlotTest is a test class for testing the behavior of DCStackBarPlot
"
Class {
	#name : #DCStackBarPlotTest,
	#superclass : #TestCase,
	#instVars : [
		'plot',
		'x',
		'y',
		'combined'
	],
	#category : #'DataChart-Tests-Core'
}

{ #category : #running }
DCStackBarPlotTest >> setUp [
	super setUp.
	plot := DCBarPlot new.
	combined := DCStackBarPlot new.
	x := 1 to: 100.
	y := ( x raisedTo: 2).
	"Put here a common initialization logic for tests"
]

{ #category : #tests }
DCStackBarPlotTest >> testAddingAnotherPlot [
	
	| linePlot |
	linePlot := DCLinePlot new x: x; y: y.	
	self should: [ combined add: linePlot ] raise:  Error.
	
]

{ #category : #tests }
DCStackBarPlotTest >> testAddingOneByOnePlot [
	
	plot y: y.	
	combined add: plot.
	self assert: combined plots size equals:1.
	plot y: (y raisedTo:2).
	combined add: plot.
	self assert: combined plots size equals:2.
	
]

{ #category : #tests }
DCStackBarPlotTest >> testAddingPlots [
	
	plot y: y.	
	combined add: plot.
]

{ #category : #tests }
DCStackBarPlotTest >> testBasic [

	self assert: plot settings class equals: DCPlotSettings.
	self assert: plot x isNil.
	self assert: plot y isNil.
	self assert: plot chart class equals: RSChart.
]
