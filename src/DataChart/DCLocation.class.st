Class {
	#name : #DCLocation,
	#superclass : #RSLocation,
	#instVars : [
		'legend'
	],
	#category : #'DataChart-Decoration'
}

{ #category : #initialization }
DCLocation >> initialize [ 
	super initialize.
	self
		offset: 0;
		outer.
]

{ #category : #'public - modifiers' }
DCLocation >> inner [
	super inner.
	legend ifNotNil: [ legend targetOnlyBox ] 
]

{ #category : #accessing }
DCLocation >> legend [
	^ legend
]

{ #category : #accessing }
DCLocation >> legend: aDCLegend [ 
	legend := aDCLegend
]
