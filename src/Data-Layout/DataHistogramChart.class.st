Class {
	#name : #DataHistogramChart,
	#superclass : #DataChart,
	#category : #'Data-Layout'
}

{ #category : #'adding-plots' }
DataHistogramChart >> addData: aDictionnary [

	|  myData |
	self data: aDictionnary.
	myData := aDictionnary asArray.
	myData do: [ :each| self chart addPlot: (self yourPlot x: each)]
]

{ #category : #adding }
DataHistogramChart >> yourPlot [
	^ RSHistogramPlot new.
]
