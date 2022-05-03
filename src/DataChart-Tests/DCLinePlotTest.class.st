"
A DCLinePlotTest is a test class for testing the behavior of DCLinePlot
"
Class {
	#name : #DCLinePlotTest,
	#superclass : #TestCase,
	#instVars : [
		'df'
	],
	#category : #'DataChart-Tests-Core'
}

{ #category : #tests }
DCLinePlotTest >> setUp [
	super setUp.
	df := DataFrame 
		withColumns: 
			{ { 'john'. 'mary'. 'peter'. 'jeff'. 'bill'. 'lisa'. 'jose' }.
			#(23 78 22 19 45 33 20).
			{ 'M'. 'F'. 'M'. 'M'. 'M'. 'F'. 'M' }.
			{ 'california'. 'dc'. 'california'. 'dc'. 'california'. 'texas'. 'texas' }.
			#(2 0 0 3 2 1 4).
			#(5 1 0 5 2 2 3) }
		columnNames: #(name age gender state num_children num_pets)
	
	
]

{ #category : #tests }
DCLinePlotTest >> testAddData [
	| plot yIndex xIndex|
	plot := DCLinePlot new
	dataFrame: df;
	xColumnName: 'num_pets';
	yColumnName: 'num_children';
	yourself.
	plot build. 
	xIndex := df columnNames indexOf: #num_pets.
	yIndex := df columnNames indexOf: #num_children.
	self assert: plot x equals: (df columnAt: xIndex) values.
	self assert: plot y equals: (df columnAt: yIndex) values.
	
	
	
]

{ #category : #tests }
DCLinePlotTest >> testAddDataFromDF [
	| plot yIndex xIndex|
	self skip.
	plot := df linePlot;
		xColumnName: 'num_pets';
		yColumnName: 'num_children';
		yourself.
	plot build. 
	xIndex := df columnNames indexOf: #num_pets.
	yIndex := df columnNames indexOf: #num_children.
	self assert: plot x equals: (df columnAt: xIndex) values.
	self assert: plot y equals: (df columnAt: yIndex) values.
	
	
	
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
