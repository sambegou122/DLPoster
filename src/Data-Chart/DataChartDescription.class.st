Class {
	#name : #DataChartDescription,
	#superclass : #Object,
	#instVars : [
		'kind',
		'dataChart'
	],
	#category : #'Data-Chart-Description'
}

{ #category : #accessing }
DataChartDescription >> canvas [
	^ dataChart canvas
]

{ #category : #accessing }
DataChartDescription >> color: aString [ 
	
]

{ #category : #accessing }
DataChartDescription >> dataChart [
	^ dataChart
]

{ #category : #accessing }
DataChartDescription >> kind [
	^ kind
]

{ #category : #accessing }
DataChartDescription >> kind: aString [ 
	kind := aString.
	dataChart := DataChart from: kind.
]

{ #category : #showing }
DataChartDescription >> show [
	^ dataChart show
		setLabel: 'Data Chart';
		yourself
]
