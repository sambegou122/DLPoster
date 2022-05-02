Class {
	#name : #DataFrameChartDescription,
	#superclass : #DataChartDescription,
	#instVars : [
		'dataFrame'
	],
	#category : #'DataChart-Description'
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
	data := (self dataFrame columnAt: index) values .
	^ data.
	
	
]

{ #category : #accessing }
DataFrameChartDescription >> xColumnName: aString [ 
	self x: (self extratData:aString).
	self xtitle: aString.
]

{ #category : #accessing }
DataFrameChartDescription >> yColumnName: aString [ 
	self y: (self extratData:aString).
	self ytitle: aString.
]
