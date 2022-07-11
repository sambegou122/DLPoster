Extension { #name : #DCChartPlot }

{ #category : #'*DataChart-DataFrame' }
DCChartPlot >> dataFrame [
	^ self settings dataFrame
]

{ #category : #'*DataChart-DataFrame' }
DCChartPlot >> dataFrame: aDataFrame [ 
	self settings dataFrame: aDataFrame
]

{ #category : #'*DataChart-DataFrame' }
DCChartPlot >> extratData: aString [ 
	| symbol index dataFrame|	
	symbol := aString asSymbol.
	index := self dataFrame columnNames indexOf: symbol.
	dataFrame := (self dataFrame columnAt: index) values.
	^ dataFrame
]

{ #category : #'*DataChart-DataFrame' }
DCChartPlot >> xColumnName: aString [ 
	self x: (self extratData: aString).
]

{ #category : #'*DataChart-DataFrame' }
DCChartPlot >> yColumnName: aString [ 
	self y: (self extratData:aString).
]
