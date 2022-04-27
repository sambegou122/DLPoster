Class {
	#name : #DataFrameChartDescription,
	#superclass : #DataChartDescription,
	#instVars : [
		'dataFrame',
		'x',
		'y'
	],
	#category : #'Data-Chart-Description'
}

{ #category : #accessing }
DataFrameChartDescription >> dataFrame [
	^ dataFrame
]

{ #category : #accessing }
DataFrameChartDescription >> dataFrame: aCollection [ 
	dataFrame := aCollection
]

{ #category : #accessing }
DataFrameChartDescription >> extratData: aString [ 
	| symbol index data|	
	symbol := aString asSymbol.
	index := self dataFrame columnNames indexOf: symbol.
	data := self dataFrame columnAt: index.
	^ data.
	
	
]

{ #category : #showing }
DataFrameChartDescription >> show [
	self dataChart addAll: { self x . self y }.
	^ self dataChart show
		setLabel: 'Data Chart'
		yourself.
	
]

{ #category : #accessing }
DataFrameChartDescription >> x [
	^x
	
	
	
]

{ #category : #accessing }
DataFrameChartDescription >> x: aString [ 
	x := self extratData:aString .
	
	
	
]

{ #category : #accessing }
DataFrameChartDescription >> y [
	^ y
	
]

{ #category : #accessing }
DataFrameChartDescription >> y: aString [ 
	y := self extratData:aString.
	
]
