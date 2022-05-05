Class {
	#name : #DCScatterPlot,
	#superclass : #DCPlot,
	#category : #'DataChart-Core'
}

{ #category : #default }
DCScatterPlot >> defaultKind [
	^ RSScatterPlot new
]
