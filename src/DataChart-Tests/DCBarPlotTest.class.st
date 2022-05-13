"
A DCBarPlotTest is a test class for testing the behavior of DCBarPlot
"
Class {
	#name : #DCBarPlotTest,
	#superclass : #TestCase,
	#instVars : [
		'plot',
		'x',
		'y'
	],
	#category : #'DataChart-Tests-Core'
}

{ #category : #running }
DCBarPlotTest >> setUp [
	super setUp.
	
	plot := DCBarPlot new.
	x := 0 to: 100.
	y := (x raisedTo: 3).
]

{ #category : #tests }
DCBarPlotTest >> testAddAxis [ 
	
	plot y: y.
	
	self assert: plot x size equals: y size.
	self assert: plot y equals: y.
	 
]

{ #category : #tests }
DCBarPlotTest >> testBasic [ 
	
	self assert: plot settings class equals: DCPlotSettings.
	self assert: plot x isNil.
	self assert: plot y isNil.
	self assert: plot chart class equals: RSChart.
	self assert: plot kind class equals: RSBarPlot.
]
