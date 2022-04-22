Class {
	#name : #DataHistogramChart,
	#superclass : #DataChart,
	#category : #'Data-Layout'
}

{ #category : #adding }
DataHistogramChart >> addData: aDictionnary [
	| x y |
	self data: aDictionnary.
	y := (self data at:2 ifAbsent: (self data at:1)).
	x :=(self data at:1).
	x==y ifTrue: [ self chart addPlot: (RSHistogramPlot new y:x) ] 
			ifFalse:[ self chart addPlot: (RSHistogramPlot new x: x y:y) ] 
]
