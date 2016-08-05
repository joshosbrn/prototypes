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
scrollPoint2 = 4425
scrollPoint3 = 4425
scrollPoint4 = 7000
transitionTime = .1
# Import Assets

# Import list of stories
storyFeed = new Layer
	width: 1025
	height: 8268
	image: "images/story-with-nav-1025x8268.png"
	y:10

# Make stories scrollable
feedScroll = ScrollComponent.wrap(storyFeed)
feedScroll.scrollHorizontal = false
feedScroll.mouseWheelEnabled = true

# Import Homepage
homeFeed = new Layer
	width: 1025
	height: 2374
	image: "images/homepage-scroll-2.png"
	
homeFeed.on Events.Click, (event, layer) ->
	homeFeed.visible = false
	sponsorshipTwo.opacity = 1

# Import sticky headers
stickyHeaderOne = new Layer
	width: 1045
	height: 55
	image: "images/sticky-story-header-1025x55.png"
	x: -10
	opacity: 0

stickyHeaderTwo = new Layer
	width: 1045
	height: 55
	image: "images/sticky-homepage-nav-2-1025x55.png"
	x: -10
	opacity: 0

# Static elements
player = new Layer
	width: 300
	height: 97
	image: "images/player-unit.png"
	x: 705

# Import sponsorship
sponsorshipOne = new Layer
	width: 300
	height: 601
	x: 705
	y: 108
	image: "images/sponsorship-one.png"
	opacity: 0
	
# Import sponsorship
sponsorshipTwo = new Layer
	width: 300
	height: 601
	x: 705
	y: 108
	image: "images/sponsorship-two.png"
	opacity: 0

sponsorshipThree = new Layer
	width: 300
	height: 601
	x: 705
	y: 108
	image: "images/sponsorship-three.png"
	opacity: 0

sponsorshipThreeCollapsed = new Layer
	width: 300
	height: 200
	x: 705
	y: 108
	image: "images/sponsorship-three-collapsed.png"
	opacity: 0
# Sticky Header Animations
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
	
	if  feedScroll.scrollY > scrollPoint2
		stickyHeaderOne.animate
			properties:
				opacity: 0
			time: transitionTime

	# Second sticky header
	if  feedScroll.scrollY > scrollPoint2
		stickyHeaderTwo.animate
			properties:
				opacity: 1
			time: transitionTime
	
	if  feedScroll.scrollY < scrollPoint2
		stickyHeaderTwo.animate
			properties:
				opacity: 0
			time: transitionTime
# Sponsorship Animations
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
		sponsorshipTwo.animate
			properties:
				opacity: 0
			time: transitionTime
		sponsorshipOne.animate
			properties:
				opacity: 0
			time: transitionTime
	
	if feedScroll.scrollY < scrollPoint3
		sponsorshipThree.animate
			properties:
				opacity: 0
			time: transitionTime
		sponsorshipTwo.animate
			properties:
				opacity: 1
			time: transitionTime
	
	# Third Collapsed sponsorship unit
	if feedScroll.scrollY > scrollPoint4
		sponsorshipThree.animate
			properties:
				opacity: 0
			time: transitionTime
		sponsorshipThreeCollapsed.animate
			properties:
				opacity: 1
			time: transitionTime
	
	if feedScroll.scrollY < scrollPoint4
		sponsorshipTwo.animate
			properties:
				opacity: 1
			time: transitionTime
			
		sponsorshipThreeCollapsed.animate
			properties:
				opacity: 0
			time: transitionTime		
