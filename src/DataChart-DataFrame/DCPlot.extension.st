Extension { #name : #DCPlot }

{ #category : #'*DataChart-DataFrame' }
DCPlot >> dataFrame [
	^ self settings dataFrame
]

{ #category : #'*DataChart-DataFrame' }
DCPlot >> dataFrame: aDataFrame [ 
	self settings dataFrame: aDataFrame
]

{ #category : #'*DataChart-DataFrame' }
DCPlot >> extratData: aString [ 
	| symbol index dataFrame|	
	symbol := aString asSymbol.
	index := self dataFrame columnNames indexOf: symbol.
	dataFrame := (self dataFrame columnAt: index) values .
	^ dataFrame.
]

{ #category : #'*DataChart-DataFrame' }
DCPlot >> xColumnName: aString [ 
	self x: (self extratData: aString).
]

{ #category : #'*DataChart-DataFrame' }
DCPlot >> yColumnName: aString [ 
	self y: (self extratData:aString).
]
