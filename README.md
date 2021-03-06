# DEPRECATED #

I added the code to the FileTransfer class of PhoneGap. I think it will be added in a future release!
https://github.com/callback/callback-ios/pull/27

# Download Plugin #
By Alexander Keller
   ak@aflx.de
   http://www.aflx.de

Use this to download binary files.

## Using the plugin ##

<pre>

var downloader = new Downloader();
downloader.downloadFile(
	source, 
	filePath, 
	function(entry) {
		console.log("Finished downloading: " + entry.fullPath);
	}, 
	function(e) {
		console.log("Error: " + e.code);
		console.log("Error source: " + e.source);
		console.log("Error target: " + e.target);	
	}
);

</pre>

## NOTE ##

The latest version of this plugin uses the File class of PhoneGap. So if you have trouble with this, try an older version (for example: https://github.com/aflx/pg_downloader_plugin_ios/tree/3dda445c30fb528c6cf10760102f49b0e8326437) or use the sources of PhoneGap (https://github.com/callback/callback-ios).

## REFERENCE ##

iOS:

Aaron K. Saunders
http://blog.clearlyinnovative.com

Android:

Mauro Rocco 
http://www.toforge.com

## LICENCE ##

The MIT License
Copyright (c) 2011 Alexander Keller

Permission is hereby granted, free of charge, to any person obtaining a copy of this 
software and associated documentation files (the "Software"), to deal in the Software 
without restriction, including without limitation the rights to use, copy, modify, 
merge, publish, distribute, sublicense, and/or sell copies of the Software, and to 
permit persons to whom the Software is furnished to do so, subject to the following 
conditions:

The above copyright notice and this permission notice shall be included in all copies 
or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR 
PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE 
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE 
OR OTHER DEALINGS IN THE SOFTWARE.
