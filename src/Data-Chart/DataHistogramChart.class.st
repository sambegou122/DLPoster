Class {
	#name : #DataHistogramChart,
	#superclass : #DataChart,
	#category : #'Data-Chart-Kind'
}

{ #category : #accessing }
DataHistogramChart class >> kind [
	^ 'histogram'
]

{ #category : #'adding-plots' }
DataHistogramChart >> addData: aDictionnary [

	|  myData |
	self data: aDictionnary.
	myData := aDictionnary asArray.
	myData do: [ :each| self chart addPlot: (self yourPlot x: each)]
]

{ #category : #showing }
DataHistogramChart >> yourPlot [
	^ RSHistogramPlot new.
]
