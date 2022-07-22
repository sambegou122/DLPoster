Class {
	#name : #DCCircularPlot,
	#superclass : #DCPlot,
	#instVars : [
		'size',
		'data',
		'extent'
	],
	#category : #'DataChart-Core'
}

{ #category : #building }
DCCircularPlot >> build [
	^ self subclassResponsibility.
]

{ #category : #accessing }
DCCircularPlot >> data [
	^ data
]

{ #category : #accessing }
DCCircularPlot >> data: aCollection [ 
	data := aCollection
]

{ #category : #default }
DCCircularPlot >> defaultKind [ 
	^ self subclassResponsibility.
]

{ #category : #accessing }
DCCircularPlot >> extent [
	^extent
]

{ #category : #accessing }
DCCircularPlot >> extent: aPoint [
	extent := aPoint
]

{ #category : #initialization }
DCCircularPlot >> initialize [ 
	super initialize.
]

{ #category : #accessing }
DCCircularPlot >> mainShapes [
	^ self kind shapes. 
]

{ #category : #showing }
DCCircularPlot >> show [
	^ self subclassResponsibility.
]
