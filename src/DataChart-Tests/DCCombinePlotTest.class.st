"
A DCCombinePlotTest is a test class for testing the behavior of DCCombinePlot
"
Class {
	#name : #DCCombinePlotTest,
	#superclass : #TestCase,
	#category : #'DataChart-Tests-Core'
}

{ #category : #tests }
DCCombinePlotTest >> testAddingPlots [
	| x line1 line2 line3 combined se |

	x := 0.0 to: 2 count: 100.

	line1 := DCLinePlot new
		x: x;
		y: (x raisedTo: 2);
		yourself.

	line2 := DCLinePlot new
		x: x;
		y: (x raisedTo: 3);
		yourself.
	
	line3 := DCLinePlot new
		x: x;
		y: (x raisedTo: 3);
		yourself.
	
	combined := DCCombinePlot new withAll: { line1. line2. line3 }.
	combined 
		title: 'Hello world';
		xlabel: 'X Axis';
		ylabel: 'Y Axis';
	build.
	se := combined settings .
	self assert: combined plots equals: { line1. line2. line3 }.
	self assert: se title equals: 'Hello world'.
	self assert: se xlabel equals: 'X Axis'.
	self assert: se ylabel equals: 'Y Axis'.
	
	
]

{ #category : #tests }
DCCombinePlotTest >> testBasic [
	| plot |
	plot := DCCombinePlot new.
	self assert: plot settings class equals: DCPlotSettings.
	self assert: plot plots equals: {  }.
	
]
