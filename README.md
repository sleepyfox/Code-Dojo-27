Code Dojo 27
============
This is my worked example from the 27th meeting of the London Code Dojo. Feel free to play around with it. I've used Node.js and CoffeeScript with the Mocha testing library and the Chai assertion library.

The tests can be run from the command-line with [mocha](http://visionmedia.github.io/mocha/) and [chai](http://chaijs.com/):
	
	npm test

The source of the kata I remember as Dave Thomas's Pragmatic Programmers site, but I can't find it there now, strange. You can find out more about the London Code Dojo at our [homepage](http://www.meetup.com/London-Code-Dojo/).
 
Problem definition
---
The client runs a pub, the pub serves beer. Beer is served in 1 pint glasses, each of which hold 20 fluid ounces of liquid.

Every time the customer drinks, 1 fluid ounce is consumed. Every time the customer quaffs, 4 fluid ounces are consumed. Every time the customer tries to 'down in one', the entire remaining contents of the glass are consumed (or spilled, we're not concerned with spillage at this stage). 

When the landlord fills the glass, the weights and measures act of 1963 regulates that the glass must be filled with exactly 1 Imperial pint measure i.e. 20 fluid ounces. 

Write a simple application to keep track of customer's beer glasses and how much fluid they contain. 

When you've done this then extend your solution for half-pint glasses.

When you've done this then extend your solution for three-pint jugs.

