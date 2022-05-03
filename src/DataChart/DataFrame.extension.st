Extension { #name : #DataFrame }

{ #category : #'*DataChart' }
DataFrame >> barPlot [
	^ self chart 
		kind:#bar
]

{ #category : #'*DataChart' }
DataFrame >> chart [
	^ DataFrameChartDescription new
		dataFrame: self;
		yourself
]

{ #category : #'*DataChart' }
DataFrame >> linePlot [
	^ DCLinePlot new
		dataFrame: self;
		yourself
]
