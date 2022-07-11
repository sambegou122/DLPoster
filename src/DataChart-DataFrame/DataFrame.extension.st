Extension { #name : #DataFrame }

{ #category : #'*DataChart-DataFrame' }
DataFrame >> barPlot [
	^ DCBarPlot new
		dataFrame: self;
		yourself
]

{ #category : #'*DataChart-DataFrame' }
DataFrame >> combinedPlot [
	^ DCCombinePlot new
		dataFrame: self;
		yourself
]

{ #category : #'*DataChart-DataFrame' }
DataFrame >> histogramPlot [
	^ DCHistogramPlot new
		dataFrame: self;
		yourself
]

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
