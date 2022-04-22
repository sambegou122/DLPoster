Class {
	#name : #DataLineChart,
	#superclass : #DataChart,
	#category : #'Data-Layout'
}

{ #category : #adding }
DataLineChart >> addData: aDictionnary [
	| x y |
	self data: aDictionnary.
	y := (self data at:2 ifAbsent: (self data at:1)).
	x :=(self data at:1).
	x==y ifTrue: [ self chart addPlot: (RSLinePlot new y:x) ] 
			ifFalse:[ self chart addPlot: (RSLinePlot new x: x y:y) ] 
]
