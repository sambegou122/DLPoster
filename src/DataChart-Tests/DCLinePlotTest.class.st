"
A DCLinePlotTest is a test class for testing the behavior of DCLinePlot
"
Class {
	#name : #DCLinePlotTest,
	#superclass : #TestCase,
	#category : #'DataChart-Tests-Core'
}

{ #category : #tests }
DCLinePlotTest >> testBasic [
	| plot |
	plot := DCLinePlot new.
	self assert: plot settings class equals: DCPlotSettings.
	self assert: plot x isNil.
	self assert: plot y isNil.
	self assert: plot chart class equals: RSChart.
	
]

{ #category : #tests }
DCLinePlotTest >> testBuild [
	| plot x y |
	x := 1 to: 100.
	y := x raisedTo: 2.
	plot := DCLinePlot new.
	self assert: plot kind class equals: RSLinePlot.
	plot 
		x: x;
		y: y;
		build.
	self assert: plot mainShapes size equals: 1.
	self assert: plot mainShapes first class equals: RSPolyline.
	
	
]
