Class {
	#name : #DCPieDecorationTest,
	#superclass : #TestCase,
	#category : #'DataChart-Tests-Decoration'
}

{ #category : #tests }
DCPieDecorationTest >> testBasic [ 
	| decoration |
	decoration := DCPieLabelDecoration new.
	self assert: decoration class equals: DCPieLabelDecoration.
	self assert: decoration fontSize equals: decoration defaultfontSize.
	self assert: decoration totalSum equals: 0.
	self assert: decoration shouldUseLabelOut equals: false.
]
