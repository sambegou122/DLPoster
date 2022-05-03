Extension { #name : #DataFrame }

{ #category : #'*DataChart-DataFrame' }
DataFrame >> barPlot [
	^ self chart 
		kind:#bar
]

{ #category : #'*DataChart-DataFrame' }
DataFrame >> chart [
	^ DataFrameChartDescription new
		dataFrame: self;
		yourself
]

{ #category : #'*DataChart-DataFrame' }
DataFrame >> linePlot [
	^ DCLinePlot new
		dataFrame: self;
		yourself
]
