Class {
	#name : #DataBoxChart,
	#superclass : #DataChart,
	#category : #'Data-Layout'
}

{ #category : #adding }
DataBoxChart >> yourPlot [
	^ RSBoxPlot new.
]
