Class {
	#name : #DCBoxPlotTest,
	#superclass : #TestCase,
	#instVars : [
		'plot',
		'x',
		'y'
	],
	#category : #'DataChart-Tests-Core'
}

{ #category : #running }
DCBoxPlotTest >> setUp [
	super setUp.
	
	"Put here a common initialization logic for tests"
	plot := DCBoxPlot new.
	y := { { 1. 2. 3. 4. 5. } . 
			 { 5. 6. 7. 5. 10. }  .
			 { 12. 12. 13. 14. 15. 24. }  }. 
]

{ #category : #running }
DCBoxPlotTest >> testBasic [

	self assert: plot settings class equals: DCPlotSettings.
	self assert: plot x isNil.
	self assert: plot y isNil.
	self assert: plot chart class equals: RSChart.
	self assert: plot kind class equals: RSBoxPlot.
	
]

{ #category : #running }
DCBoxPlotTest >> testBuild [
	|shapes values|
	self assert: plot kind class equals: RSBoxPlot.
	plot 
		y: y;
		build.
	shapes := plot mainShapes select:[:shape| shape class = RSBox].
	values := shapes collect:[: shape| shape model].
	self assert: shapes size equals: y size.
	self assert: values size equals: y size.
]
