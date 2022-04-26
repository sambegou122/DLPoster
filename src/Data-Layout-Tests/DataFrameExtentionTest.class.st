Class {
	#name : #DataFrameExtentionTest,
	#superclass : #TestCase,
	#instVars : [
		'df',
		'window'
	],
	#category : #'Data-Layout-Tests-DataFrame'
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
DataFrameExtentionTest >> testBasic [
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
	shapes := chart canvas shapes collect: [:shape | shape class = RSEllipse ].
	
	self assert: shapes size equals: (df column: 'num_children') size.
	
	
]
