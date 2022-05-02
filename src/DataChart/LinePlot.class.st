Class {
	#name : #LinePlot,
	#superclass : #DataFrameChartDescription,
	#category : #'DataChart-Plots'
}

{ #category : #initialization }
LinePlot >> initialize [ 
	super initialize.
	self kind: #line.
]
