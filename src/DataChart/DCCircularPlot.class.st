Class {
	#name : #DCCircularPlot,
	#superclass : #DCPlot,
	#instVars : [
		'size',
		'data'
	],
	#category : #'DataChart-Core'
}

{ #category : #building }
DCCircularPlot >> build [ 
	self subclassResponsibility
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
	self subclassResponsibility
]

{ #category : #default }
DCCircularPlot >> defaultSize [
	self subclassResponsibility
]

{ #category : #initialization }
DCCircularPlot >> initialize [ 
	super initialize.
	self size: self defaultSize.
]

{ #category : #accessing }
DCCircularPlot >> show [ 
	self subclassResponsibility
]

{ #category : #accessing }
DCCircularPlot >> size [
	^ size.
]

{ #category : #accessing }
DCCircularPlot >> size: aNumber [
	size:= aNumber
]
