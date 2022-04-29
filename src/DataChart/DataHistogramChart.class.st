Class {
	#name : #DataHistogramChart,
	#superclass : #DataChart,
	#category : #'DataChart-Kind'
}

{ #category : #accessing }
DataHistogramChart class >> kind [
	^ 'histogram'
]

{ #category : #'adding-plots' }
DataHistogramChart >> addData: aDictionnary [

	|  myData |
	self data: aDictionnary.
	myData := aDictionnary at: 2.
	self chart addPlot: (self yourPlot x:myData).
]

{ #category : #'adding-plots' }
DataHistogramChart >> beforeShowing [

]

{ #category : #'adding-plots' }
DataHistogramChart >> initialize [ 
	| deco |
	super initialize.
	deco := self decorations at:1.
	deco fromNames: self xlabel. 
]

{ #category : #showing }
DataHistogramChart >> yourPlot [
	^ RSHistogramPlot new.
]
