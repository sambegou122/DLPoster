Extension { #name : #DataFrame }

{ #category : #'*Data-Chart' }
DataFrame >> chart [
	^ DataFrameChartDescription new
		dataFrame: self;
		yourself
]
