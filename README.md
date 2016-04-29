# Marvel Code Challenge

# I've not finished the challenge yet and I'm REALLY sorry about that =/

## Explanation
  - I was concerned to make over engineering, but thinking in a real scenario where this app could grow more and more I developed it in a good abstraction level (specially the networkig layer).
  - Another pattern that I questioned myself was the Mediator to abstract as much as possible the flow, taking the resposability off from 'prepareForSegue' in the viewcontrollers. And it can be changed easily by the Coordinator pattern.
  - The view layer is encharge to retain outlets and do the animations with the components.

## What's missing?
  - Filter characters by name, but only screen the rest (service layer, parser and etc) is developed
  - Give more attention to unit test
  - LauchScreen animation
