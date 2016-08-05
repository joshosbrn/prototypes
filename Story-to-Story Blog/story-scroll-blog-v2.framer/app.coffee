# NPR.org Story-to-Story Scroll
# Josh Osborne
# 8/4/2016
# :)

# Project Info & Setup

# Weird but necessary contentScale fix
Framer.Device.contentScale = 1

Framer.Info =
	title: "Story-To-Story Scroll – NPR.org"
	author: "Josh Osborne"
	twitter: "joshosbrn"
	description: "Exploring the interactions and transitions necessary for a smooth story-to-story scroll experience on NPR.org."

# Use desktop cursor
document.body.style.cursor = "auto"

# Disable right-click context menu
if document.addEventListener?
	document.addEventListener("contextmenu", (event) -> event.preventDefault())

# Background of prototype should be same color as story bg
bg = new BackgroundLayer
    backgroundColor: "#E0E0E0"


# Variables
scrollPoint1 = 310
scrollPoint2 = 1789
scrollPoint3 = 3971
transitionTime = .1
# Import Assets
# Import list of stories
storyFeed = new Layer
	width: 1024
	height: 8552
	image: "images/scroll-blog-content-v3.jpg"

# Make stories scrollable
feedScroll = ScrollComponent.wrap(storyFeed)
feedScroll.scrollHorizontal = false
feedScroll.mouseWheelEnabled = true

# Import sticky headers
stickyHeaderOne = new Layer
	width: 1045
	height: 55
	image: "images/sticky-header-global.png"
	x: -10
	opacity: 0

# Static elements
playerAndSponsorship = new Layer
	width: 305
	height: 712
	image: "images/static-player@2x.png"
	x: 705
	
# Import sponsorship
sponsorshipTwo = new Layer
	width: 306
	height: 601
	x: 705
	y: 108
	image: "images/sponsorship-two.png"
	opacity: 0

sponsorshipThree = new Layer
	width: 306
	height: 601
	x: 705
	y: 108
	image: "images/sponsorship-three.png"
	opacity: 0

sucessfulSubscribe = new Layer
	image: "images/subscribed.png"
	width: 500
	height: 38
	x: 130
	y: 1283
	opacity: 0

subscribeTarget = new Layer
	width: 292
	height: 38
	x: 232
	y: 1283
	backgroundColor: "rgba(255,255,255,0)"
# Sticky Events
feedScroll.on Events.Scroll, ->
	# First sticky header
	if feedScroll.scrollY > scrollPoint1
		stickyHeaderOne.animate
			properties:
				opacity: 1
			time: transitionTime
	
	if feedScroll.scrollY < scrollPoint1
		stickyHeaderOne.animate
			properties:
				opacity: 0
			time: transitionTime
# Sponsorship Events
feedScroll.on Events.Scroll, ->
	# Second sponsorship unit
	if feedScroll.scrollY > scrollPoint2
		sponsorshipTwo.animate
			properties:
				opacity: 1
			time: transitionTime
	
	if feedScroll.scrollY < scrollPoint2
		sponsorshipTwo.animate
			properties:
				opacity: 0
			time: transitionTime
	
	# Third sponsorship unit
	if feedScroll.scrollY > scrollPoint3
		sponsorshipThree.animate
			properties:
				opacity: 1
			time: transitionTime
	
	if feedScroll.scrollY < scrollPoint3
		sponsorshipThree.animate
			properties:
				opacity: 0
			time: transitionTime
# Subscribe Events
subscribeTarget.on Events.Click, (event, layer) ->
	sucessfulSubscribe.opacity = 1
# Utilities
sucessfulSubscribe.parent = storyFeed
subscribeTarget.parent = storyFeed
subscribeTarget.style.cursor = "pointer"
