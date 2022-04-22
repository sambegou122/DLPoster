Class {
	#name : #DataBoxChart,
	#superclass : #DataChart,
	#category : #'Data-Layout'
}

{ #category : #adding }
DataBoxChart >> addData: aDictionnary [
	| x y |
	self data: aDictionnary.
	y := (self data at:2 ifAbsent: (self data at:1)).
	x :=(self data at:1).
	x==y ifTrue: [ self chart addPlot: (RSBoxPlot new y:{x}) ] 
			ifFalse:[ self chart addPlot: (RSBoxPlot new x: {x} y:{y}) ] 
]
