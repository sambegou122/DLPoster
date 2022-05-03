Class {
	#name : #DataCharDataFrameTests,
	#superclass : #TestCase,
	#instVars : [
		'df'
	],
	#category : #'DataChart-DataFrame-Tests'
}

{ #category : #running }
DataCharDataFrameTests >> setUp [
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
DataCharDataFrameTests >> testAddData [
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
DataCharDataFrameTests >> testLinePlot [
	| plot yIndex xIndex|
	plot := df linePlot
		xColumnName: 'num_pets';
		yColumnName: 'num_children';
		yourself.
	plot build. 
	xIndex := df columnNames indexOf: #num_pets.
	yIndex := df columnNames indexOf: #num_children.
	self assert: plot x equals: (df columnAt: xIndex) values.
	self assert: plot y equals: (df columnAt: yIndex) values.
	
	
	
]
