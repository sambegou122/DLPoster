"
This class represent de PiePlot. The pieplot is the kind of circular plot.

    Instance Variables
	colors:		<Object> the collection of the colors that we can use for each shape.
	explodes:		<Object> the colloction  of the explodes betwen each shape
	label:		<Object> it manage the labels collection
	labels:		<Object> the collection of the labels for each shape.

"
Class {
	#name : #DCPiePlot,
	#superclass : #DCCircularPlot,
	#instVars : [
		'colors',
		'explodes',
		'labels',
		'label'
	],
	#category : #'DataChart-Core'
}

{ #category : #building }
DCPiePlot >> applyExtent [

	self extent ifNil: [ ^ self ].
	self extent x = self extent y ifFalse: [ 
		self mainShapes do: [ :shape | shape scaleBy: extent / extent x ] ]
]

{ #category : #building }
DCPiePlot >> build [
	self propagateData.
	self computeExtent.
	self kind sliceColor: self defaultColors.
	self kind build.
	self changesAfterBuilding

]

{ #category : #building }
DCPiePlot >> buildLegendData [

	self mainShapes with: self labels do: [ :shp :label | 
		self legend text: label withBoxColor: shp computeColor ].
	self legend legendDo: [ :shape | 
		shape
			withBorder;
			padding: 10;
			scaleBy: 0.5 ]
]

{ #category : #building }
DCPiePlot >> changesAfterBuilding [
	self propagateColors.
	self propagateLabels.
	self propagateExplodes.
	self applyExtent.
]

{ #category : #accessing }
DCPiePlot >> colors [
	^ colors 
]

{ #category : #accessing }
DCPiePlot >> colors: aCollectionOfColors [
	colors := aCollectionOfColors
]

{ #category : #building }
DCPiePlot >> computeExtent [
	self extent ifNotNil:[ : ex| self computeExtent: ex x/2]
	
]

{ #category : #building }
DCPiePlot >> computeExtent: aPoint [
	self kind sliceShape externalRadius: aPoint.
	
]

{ #category : #defaults }
DCPiePlot >> defaultColors [
	^ NSScale category10 
]

{ #category : #default }
DCPiePlot >> defaultKind [
	^ RSPie new.
]

{ #category : #accessing }
DCPiePlot >> explodes [
	^ explodes 
]

{ #category : #accessing }
DCPiePlot >> explodes: aCollection [ 
	explodes := aCollection
]

{ #category : #initialization }
DCPiePlot >> initialize [ 
	super initialize.
	label := DCPieLabelDecoration new.
]

{ #category : #accessing }
DCPiePlot >> label [
	^ label
]

{ #category : #accessing }
DCPiePlot >> labels [

	^ labels
]

{ #category : #accessing }
DCPiePlot >> labels: aCollection [
	labels := aCollection
]

{ #category : #building }
DCPiePlot >> propagateColors [
	self colors ifNil:[ ^ self].
	self colors with: self mainShapes do:[:color : shape| shape color: color]
]

{ #category : #building }
DCPiePlot >> propagateData [
	self kind objects: self data yourself.
]

{ #category : #building }
DCPiePlot >> propagateExplodes [
	self explodes ifNil: [ ^self ].
	self mainShapes with: self explodes do:[ :shp :ex | shp emphasizeWith: ex ]
]

{ #category : #building }
DCPiePlot >> propagateLabels [

	self labels ifNil: [ ^self ].
	self label generateLablesFor: self.
	
]

{ #category : #showing }
DCPiePlot >> show [
	^ self kind canvas open.
]

{ #category : #public }
DCPiePlot >> useLabelOut [
	self label useLabelOut
]
