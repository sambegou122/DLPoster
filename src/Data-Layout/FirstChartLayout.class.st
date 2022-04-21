Class {
	#name : #FirstChartLayout,
	#superclass : #DLPoster,
	#instVars : [
		'interaction',
		'plot',
		'chart'
	],
	#category : #'Data-layout'
}

{ #category : #accessing }
FirstChartLayout >> chart [
	^chart 
]

{ #category : #accessing }
FirstChartLayout >> chart:aChart [
	chart := aChart.
]

{ #category : #'as yet unclassified' }
FirstChartLayout >> initialize [ 
	super initialize.
	self chart: RSChart new
	
	 

]

{ #category : #accessing }
FirstChartLayout >> plot [
^plot 
]

{ #category : #accessing }
FirstChartLayout >> plot: aPlot [
	plot := aPlot
]

{ #category : #'as yet unclassified' }
FirstChartLayout >> xPlotDimention: x yPlotDimension: y [
	self plot x: x y:y
	 

]
