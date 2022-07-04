"
A DCClusterBarPlotTest is a test class for testing the behavior of DCClusterBarPlot
"
Class {
	#name : #DCClusterBarPlotTest,
	#superclass : #TestCase,
	#instVars : [
		'plot',
		'combined',
		'x',
		'y'
	],
	#category : #'DataChart-Tests-Core'
}

{ #category : #running }
DCClusterBarPlotTest >> setUp [
	super setUp.
	plot := DCBarPlot new.
	combined := DCClusterBarPlot new.
	x := 1 to: 100.
	y := ( x raisedTo: 2).
]

{ #category : #running }
DCClusterBarPlotTest >> testAddingAnotherPlot [
	
	| linePlot |
	linePlot := DCLinePlot new x: x; y: y.	
	self should: [ combined add: linePlot ] raise:  Error.
]

{ #category : #running }
DCClusterBarPlotTest >> testAddingOneByOnePlot [
	
	plot y: y.	
	combined add: plot.
	self assert: combined plots size equals:1.
	plot y: (y raisedTo:2).
	combined add: plot.
	self assert: combined plots size equals:2.
	
]

{ #category : #running }
DCClusterBarPlotTest >> testBasic [

	self assert: plot settings class equals: DCPlotSettings.
	self assert: plot x isNil.
	self assert: plot y isNil.
	self assert: plot chart class equals: RSChart.
	
]
