Extension { #name : #DCPlotSettings }

{ #category : #'*DataChart-DataFrame' }
DCPlotSettings >> dataFrame [
	^ self propertyAt: #dataFrame ifAbsent: [ nil ]
]

{ #category : #'*DataChart-DataFrame' }
DCPlotSettings >> dataFrame: aDataFrame [
	self propertyAt: #dataFrame put: aDataFrame
	
]
