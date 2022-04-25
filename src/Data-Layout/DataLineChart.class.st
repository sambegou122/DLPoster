Class {
	#name : #DataLineChart,
	#superclass : #DataChart,
	#category : #'Data-Layout'
}

{ #category : #adding }
DataLineChart >> yourPlot [
	^ RSLinePlot new. 
]
