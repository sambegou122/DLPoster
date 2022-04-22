Class {
	#name : #DataChart,
	#superclass : #Object,
	#instVars : [
		'data',
		'chart',
		'color'
	],
	#category : #'Data-Layout'
}

{ #category : #'accessing - attributes' }
DataChart >> chart [ 
	^ chart
]

{ #category : #'accessing - attributes' }
DataChart >> chart: aChart [
	chart := aChart
	
]

{ #category : #'accessing - data' }
DataChart >> data [
	^ data
]

{ #category : #'accessing - data' }
DataChart >> data: aData [
	data := aData
]

{ #category : #initialization }
DataChart >> initialize [ 
	super initialize.
	self chart: RSChart new.
]

{ #category : #showing }
DataChart >> show [
	^ self chart
]
