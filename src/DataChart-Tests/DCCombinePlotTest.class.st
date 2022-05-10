"
A DCCombinePlotTest is a test class for testing the behavior of DCCombinePlot
"
Class {
	#name : #DCCombinePlotTest,
	#superclass : #TestCase,
	#instVars : [
		'combined',
		'line1',
		'line2',
		'line3'
	],
	#category : #'DataChart-Tests-Core'
}

{ #category : #running }
DCCombinePlotTest >> setUp [
	| x |
	super setUp.
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
		y: (x raisedTo: 4);
		yourself.
	combined := DCCombinePlot new.
]

{ #category : #tests }
DCCombinePlotTest >> testAddOneByOnePlot [
	combined := DCCombinePlot new.
	self assert: combined plots isEmpty.
	combined add: line1.
	self assert: combined plots size equals: 1.
	combined add: line2.
	self assert: combined plots size equals: 2.
	combined add: line3.
	self assert: combined plots size equals: 3.
	combined build.
]

{ #category : #tests }
DCCombinePlotTest >> testAddingDecoration [
	| decoration line box bbbox |
	decoration := DCVerticalLineDecoration new.
	decoration x: 1.
	combined addAll: { line1. line2. line3 }.
	combined
		title: 'Hello world';
		xlabel: 'X Axis';
		ylabel: 'Y Axis';
		add: decoration;
	build.
	line := decoration createdShapes first.
	box := combined chart canvas shapes first.
	bbbox := box encompassingRectangle.
	self assert: box class equals: RSBox.
	self assert: bbbox bottom equals: line startPoint y.
	self assert: bbbox top equals: line endPoint y.
	self assert: line startPoint x equals: line endPoint x.
	self assert: (line startPoint x between: bbbox left and: bbbox right).
	
	
]

{ #category : #tests }
DCCombinePlotTest >> testAddingPlots [
	| se |
	combined := DCCombinePlot withAll: { line1. line2. line3 }.
	se := combined settings.
	self assert: combined plots asArray equals: { line1. line2. line3 }.
	
	
	
]

{ #category : #tests }
DCCombinePlotTest >> testBasic [
	| plot se |
	plot := DCCombinePlot new.
	self assert: plot settings class equals: DCPlotSettings.
	self assert: plot plots isEmpty.
	combined 
		title: 'Hello world';
		xlabel: 'X Axis';
		ylabel: 'Y Axis'.
	se := combined settings.
	self assert: se title equals: 'Hello world'.
	self assert: se xlabel equals: 'X Axis'.
	self assert: se ylabel equals: 'Y Axis'.
]

{ #category : #tests }
DCCombinePlotTest >> testBuildWithEmptyPlots [
	combined := DCCombinePlot withAll: {  }.
	self should: [ combined build ] raise: Error
	
]
