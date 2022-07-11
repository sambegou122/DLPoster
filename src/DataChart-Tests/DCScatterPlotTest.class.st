"
A DCScatterPlotTest is a test class for testing the behavior of DCScatterPlot
"
Class {
	#name : #DCScatterPlotTest,
	#superclass : #TestCase,
	#category : #'DataChart-Tests-Core'
}

{ #category : #tests }
DCScatterPlotTest >> testBasic [
	| plot |
	plot := DCScatterPlot new.
	self assert: plot settings class equals: DCPlotSettings.
	self assert: plot x isNil.
	self assert: plot y isNil.
	self assert: plot chart class equals: RSChart.
]

{ #category : #tests }
DCScatterPlotTest >> testBuild [
	| plot x y |
	x := 1 to: 100.
	y := x raisedTo: 2.
	plot := DCScatterPlot new.
	self assert: plot kind class equals: RSScatterPlot.
	plot 
		x: x;
		y: y;
		build.
	self assert: plot mainShapes size equals: x size.
	self assert: plot mainShapes first class equals: RSEllipse.
]
