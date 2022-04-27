Class {
	#name : #DataFrameExtentionTest,
	#superclass : #TestCase,
	#instVars : [
		'df',
		'window'
	],
	#category : #'DataChart-Tests-DataFrame'
}

{ #category : #tests }
DataFrameExtentionTest >> setUp [
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

{ #category : #running }
DataFrameExtentionTest >> tearDown [
	window ifNil: [ ^ self ].
	window delete. 
]

{ #category : #tests }
DataFrameExtentionTest >> testBasicDefault [
	| chart labels |
	chart :=  df chart
		x: 'num_children';
		y: 'num_pets';
		yourself.
	window := chart show.
	self assert: chart kind equals: #line.
	self assert: chart color isNil.
	self assert: chart extent equals: chart defaultExtent.
	chart extent: 800@600.
	self assert: chart extent equals: 800@600.
	labels := chart canvas shapes select: [ :shape | shape isLabel ].
	self assert: labels notEmpty.
	
	self assert: chart padding equals: chart defaultPadding.
	chart padding: 20@20.
	self assert: chart padding equals: 20@20.
	
	
	
]

{ #category : #tests }
DataFrameExtentionTest >> testBasicLine [
	| chart shapes |
	chart :=  df chart
		kind: #line;
		x: 'num_pets';
		y: 'num_children';
		color: 'red';
		yourself.
	self assert: chart dataChart notNil.
	window := chart show.
	self assert: chart kind equals: #line.
	self assert: window isDisplayed.
	self assert: window label equals: 'Data Chart'.
	shapes := chart canvas shapes select: [:shape | shape class = RSPolyline ].
	
	self assert: shapes size equals: 1.
	
	
]

{ #category : #tests }
DataFrameExtentionTest >> testBasicScatter [
	| chart shapes |
	chart :=  df chart
		kind: #scatter;
		x: 'num_children';
		y: 'num_pets';
		color: 'red';
		yourself.
	self assert: chart dataChart notNil.
	window := chart show.
	self assert: chart kind equals: #scatter.
	self assert: window isDisplayed.
	self assert: window label equals: 'Data Chart'.
	shapes := chart canvas shapes select: [:shape | shape class = RSEllipse ].
	self assert: shapes notEmpty.
	self assert: shapes size equals: (df column: 'num_children') size.
	self assert: shapes first color equals: Color red.
	
	
	
]

{ #category : #tests }
DataFrameExtentionTest >> testTitle [
	| chart title labels |
	chart :=  df chart
		x: 'num_children';
		y: 'num_pets';
		yourself.
	self assert: chart xtitle equals: 'num_children'.
	self assert: chart ytitle equals: 'num_pets'.
	self assert: chart title equals: 'num_children vs num_pets'.
	window := chart show.

	title := 'Simple Chart'.
	chart title: title.
	self assert: chart title equals: title.
	labels := chart canvas shapes select: #isLabel.
	self assert: (labels anySatisfy: [ :label | label text = title ]).

]
