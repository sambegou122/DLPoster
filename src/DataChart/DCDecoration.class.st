"
This represent the decoration of our DCPlot
"
Class {
	#name : #DCDecoration,
	#superclass : #RSAbstractChartDecoration,
	#instVars : [
		'x',
		'y'
	],
	#category : #'DataChart-Decoration'
}

{ #category : #adding }
DCDecoration >> addIn: aDCCombinePlot [ 
	aDCCombinePlot addDecoration: self
]

{ #category : #accessing }
DCDecoration >> x [
	^ x
]

{ #category : #initialization }
DCDecoration >> x: anInteger [
	x:= anInteger
]

{ #category : #accessing }
DCDecoration >> y [
	^ y
]

{ #category : #accessing }
DCDecoration >> y: anInteger [
	y:= anInteger.
]
