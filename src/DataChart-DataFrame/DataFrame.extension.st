Extension { #name : #DataFrame }

{ #category : #'*DataChart-DataFrame' }
DataFrame >> linePlot [
	^ DCLinePlot new
		dataFrame: self;
		yourself
]

{ #category : #'*DataChart-DataFrame' }
DataFrame >> scatterPlot [
	^ DCScatterPlot new
		dataFrame: self;
		yourself
]
