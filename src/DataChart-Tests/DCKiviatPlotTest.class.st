"
A DCKiviatPlotTest is a test class for testing the behavior of DCKiviatPlot
"
Class {
	#name : #DCKiviatPlotTest,
	#superclass : #TestCase,
	#instVars : [
		'plot',
		'data'
	],
	#category : #'DataChart-Tests-Core'
}

{ #category : #running }
DCKiviatPlotTest >> setUp [

	super setUp.
	
	plot := DCKiviatPlot new.
	data :=  {#('Food Quality' 'Food Variety' 'Service Quality' 'Ambience' 'Affordability'). #(4 4 5 4 3). #(5 5 4 5 2). #(3 4 5 3 5)}
]

{ #category : #running }
DCKiviatPlotTest >> testBasic [ 

	self assert: plot class equals: DCKiviatPlot.
	

]

{ #category : #running }
DCKiviatPlotTest >> testaddData [
	| rows shapes |
	rows := {#(4 4 5 4 3). #(5 5 4 5 2). #(3 4 5 3 5)}.
	plot data: data.
	plot build.
	shapes := plot mainShapes.
	self assert: plot kind values asArray equals: rows.
	self assert: plot data first equals: plot kind axisNames.
	self assert: shapes size equals: 3.
	
	
	

	

]
