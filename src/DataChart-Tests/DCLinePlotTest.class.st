"
A DCLinePlotTest is a test class for testing the behavior of DCLinePlot
"
Class {
	#name : #DCLinePlotTest,
	#superclass : #TestCase,
	#instVars : [
		'plot',
		'x',
		'y'
	],
	#category : #'DataChart-Tests-Core'
}

{ #category : #running }
DCLinePlotTest >> setUp [
	super setUp.
	
	plot := DCLinePlot new.
	x := 0 to: 100.
	y := (x raisedTo: 3).
]

{ #category : #tests }
DCLinePlotTest >> testAddingColor [ 
	plot color: Color green.
	plot x: x; y: y.
	plot build.
	self assert: plot chart shapes last color equals: plot color.

		
	
]

{ #category : #tests }
DCLinePlotTest >> testBasic [

	self assert: plot settings class equals: DCPlotSettings.
	self assert: plot x isNil.
	self assert: plot y isNil.
	self assert: plot chart class equals: RSChart.
	self assert: plot kind class equals: RSLinePlot.
	
]

{ #category : #tests }
DCLinePlotTest >> testBuild [
	self assert: plot kind class equals: RSLinePlot.
	plot 
		x: x;
		y: y;
		build.
	self assert: plot mainShapes size equals: 1.
	self assert: plot mainShapes first class equals: RSPolyline.
	
	
]

{ #category : #tests }
DCLinePlotTest >> testDCLineWithLabelDecoration [
	| deco |
	
	plot x: x ; y: y.
	plot add: (DCLabelDecoration new
		text: 'Foo bar';
		x: 55.5;
		y: (100 raisedTo: 2);
    yourself ).

	plot build.
	deco := plot settings decorations first.
	self assert: deco class equals: DCLabelDecoration.
	self assert: deco chart equals: plot chart.
	self assert: deco x equals: 55.5.
	self assert: deco y equals:(100 raisedTo: 2).

		
	
]

{ #category : #tests }
DCLinePlotTest >> testDCLineWithVerticalLineDecoration [
	| decoration line |
	decoration := DCVerticalLineDecoration new.
	decoration x: 50.
	line:= DCLinePlot new
		x: x;
		y: y;
		title: 'DCLinePlot';
		xlabel: ' line x';
		ylabel: 'line y';
		add: decoration;
		build;
		yourself.
		
	
]

{ #category : #tests }
DCLinePlotTest >> testSetSetting [
	| settings se |
	
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

	plot settings: settings.
	plot build.
	se := plot settings.
	self assert: se xlabel equals: settings xlabel.
	self assert: se ylabel equals: settings ylabel.
	self assert: se padding equals: settings padding.
	self assert: se extent equals: settings extent.
	self assert: se title equals: settings title.
	
	
]

{ #category : #tests }
DCLinePlotTest >> testSetter [
	| title  ylabel xlabel settings |
	title := 'DCLinePlot'.
	xlabel := 'line x'.
	ylabel := 'line y'.
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
