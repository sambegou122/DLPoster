"
A DCLinePlotTest is a test class for testing the behavior of DCLinePlot
"
Class {
	#name : #DCLinePlotTest,
	#superclass : #TestCase,
	#category : #'DataChart-Tests-Core'
}

{ #category : #tests }
DCLinePlotTest >> testAddPropreties [
	| plot x y settings se |
	x := 1 to: 100.
	y := x raisedTo: 2.
	plot := DCLinePlot new.
	self assert: plot kind class equals: RSLinePlot.
	plot 
		x: x;
		y: y.
	settings := DCPlotSettings new.
	settings
		extent: 500@ 400;
		padding: 30@30;
		color: Color purple;
		title: 'Hello World';
		xlabel: 'X axis';
		ylabel: 'Y axis'.
	
	plot addPropreties: settings properties.
	plot build.
	se := plot settings .
	self assert: se xlabel equals: settings xlabel.
	self assert: se ylabel equals: settings ylabel.
	self assert: se padding equals: settings padding.
	self assert: se extent equals: settings extent.
	self assert: se title equals: settings title.
	
	
]

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

{ #category : #tests }
DCLinePlotTest >> testDCLineWithVerticalLineDecoration [
	| x decoration line |
	decoration := DCVerticalLineDecoration new.
	decoration x: 50.
	x := 1 to: 100.
	line:= DCLinePlot new
		x: x;
		y: (x raisedTo: 3);
		title: 'DCLinePlot';
		xlabel: ' line x';
		ylabel: 'line y';
		add: decoration;
		build;
		yourself.
		
	
]

{ #category : #tests }
DCLinePlotTest >> testSetter [
	| plot x y title  ylabel xlabel settings |
	title := 'DCLinePlot'.
	xlabel := 'line x'.
	ylabel := 'line y'.
	x := 1 to: 100.
	y := x raisedTo: 2.
	plot := DCLinePlot new.
	plot 
		x: x;
		y: y;
		title: title;
		xlabel: xlabel;
		ylabel: ylabel;
		build.
	settings := plot settings.
	self assert: settings xlabel equals: xlabel.
	self assert: settings ylabel equals: ylabel.
	self assert: settings title equals: title.
	
	
]
