Class {
	#name : #DCLinePlot,
	#superclass : #DCPlot,
	#category : #'DataChart-Core'
}

{ #category : #default }
DCLinePlot >> defaultKind [
	^ RSLinePlot new
]
