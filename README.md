PlainLoaderViewDemo
===============
Demonstrates the PlainLoaderView Animations that reflects the <a href="https://itunes.apple.com/in/app/fontli/id506650372?mt=8">Fontli App's</a> Splash screen loading view animation.

<br>
There is also a writeup on the <a href="https://blog.imaginea.com/plainloaderview/">Imaginea blog</a>.

![PlainLoaderViewDemo](https://raw.githubusercontent.com/codersaru/PlainLoaderViewDemo/master/GIF/PlainLoaderViewDemo.gif)

<br>

<b>Installation :</b><br/>

	(i) Import "PlainLoaderView.swift" file into your project.
	(ii) NO other step, jump to setting it up in your controller.
	
<br/>
<b>Usage :</b>

On Your UIViewController's UI setup method, add these lines:<br/>
<b>Initialization:</b><br/>
```swift	
	var loader = PlainLoaderView(frame: self.view.frame)
	self.view.addSubview(loader)
```

<b>To set the animation duration:</b><br/>
```swift	
	loader.animationDuration = 10.0 // Defaults to 4.0
```


<b>To change the loader view’s background & animation stroke colors respectively using these 2 lines of code:</b><br/>
```swift	
	loader.backgroundColor = UIColor.gray // Defaults to clear/no-color
	loader.loaderStrokeColor = UIColor.red // Defaults to clear/no-color
```


<b>Finally add this line of code to start the animation:</b><br/>
```swift	
	loader.startAnimation()
```
<br/>
<br/>
<b>Progressive Animation:</b><br/>
If you’re downloading a series of files and in need to animate in chunks to show the progress, then calculate the percentage and inform the loader on the same.<br/>
<i>For Example, say you want to download ‘imagesCount’ number of images from the server and you’re saving those images into ‘imagesArray’ Array, then this is how you should calculate the percentage:</i><br/>
```swift	
	let percentage = ( (imagesCount - imagesArray.count) / imagesCount )
```
And assign it to the PlainLoaderView with this line of code:
```swift	
	loadingView.progress = percentage
```
<i>PlainLoaderView will automagically update the stroke progress with animation, just like it does in Fontli.</i><br/>

<br/>
<b>Apps Using this Library :</b><a href="mailto:saravanan.v@imaginea.com"> (Email me</a>, if you want some Marketing ;) )<br/>

<a href="https://itunes.apple.com/in/app/fontli/id506650372?mt=8">Fontli</a><br/>
<br/>
<br/>




<br/>
<br/>

## 👨🏻‍💻 Author
[1.1]: http://i.imgur.com/tXSoThF.png
[1]: http://www.twitter.com/saruhere

* Saravanan [![alt text][1.1]][1]

<a class="bmc-button" target="_blank" href="https://www.buymeacoffee.com/saru2020"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy me a coffee/beer" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;"><span style="margin-left:5px"></span></a>
