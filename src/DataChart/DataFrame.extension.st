Extension { #name : #DataFrame }

{ #category : #'*DataChart' }
DataFrame >> chart [
	^ DataFrameChartDescription new
		dataFrame: self;
		yourself
]
