Class {
	#name : #DCLinePlot,
	#superclass : #DCPlot,
	#instVars : [
		'data'
	],
	#category : #'DataChart-Core'
}

{ #category : #accessing }
DCLinePlot >> dataFrame [
	^ data.
]

{ #category : #extracting }
DCLinePlot >> dataFrame: aDataFrame [ 
	data := aDataFrame.
]

{ #category : #default }
DCLinePlot >> defaultKind [
	^ RSLinePlot new
]

{ #category : #default }
DCLinePlot >> extratData: aString [ 
	| symbol index dataFrame|	
	symbol := aString asSymbol.
	index := self dataFrame columnNames indexOf: symbol.
	dataFrame := (self dataFrame columnAt: index) values .
	^ dataFrame.
]

{ #category : #default }
DCLinePlot >> xColumnName: aString [ 
	self x: (self extratData: aString).
]

{ #category : #default }
DCLinePlot >> yColumnName: aString [ 
	self y: (self extratData:aString).
]
