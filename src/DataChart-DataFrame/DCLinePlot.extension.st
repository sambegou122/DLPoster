Extension { #name : #DCLinePlot }

{ #category : #'*DataChart-DataFrame' }
DCLinePlot >> dataFrame [
	^ self settings dataFrame
]

{ #category : #'*DataChart-DataFrame' }
DCLinePlot >> dataFrame: aDataFrame [ 
	self settings dataFrame: aDataFrame
]

{ #category : #'*DataChart-DataFrame' }
DCLinePlot >> extratData: aString [ 
	| symbol index dataFrame|	
	symbol := aString asSymbol.
	index := self dataFrame columnNames indexOf: symbol.
	dataFrame := (self dataFrame columnAt: index) values .
	^ dataFrame.
]

{ #category : #'*DataChart-DataFrame' }
DCLinePlot >> xColumnName: aString [ 
	self x: (self extratData: aString).
]

{ #category : #'*DataChart-DataFrame' }
DCLinePlot >> yColumnName: aString [ 
	self y: (self extratData:aString).
]
