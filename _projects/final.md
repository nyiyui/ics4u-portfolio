---
title: "Final Project (game) - Survibee"
collection: projects
teaser: "/assets/images/PXL_20230609_173338319.jpg"
blurb: "Final project for my ICS4U course. This game, Survibee, follows the path of a bee that learns about how humans are hurting everyone by e.g. using pesticides."
---

{% include base_path %}

[Source code](https://github.com/nyiyui/koseihoryuen")

- description
- individual contribution

## Description

This is our ICS4U ISP by me, [nyiyui](https://nyiyui.ca) and [purple-affogato](https://github.com/purple-affogato).
Our chosen idea was to "save the bees." Via the game, the player is intended to learn about:
- bees' contribution to the biosphere
- how bees have become endangered
- how we can revert that, helping us and bees along the way.

The game contains 3 distinct levels:
- The Learning stage teaches basic concepts about bees and how they contribute to the biosphere.
- The Testing stage quizzes teaches the mul]titude of potential solutions that are available to save the bees.
- The Gaming stage is an action game where the player colects pollen and avoid being damaged by threats e.g. humans swatting bees.

## My Contribution

*You can see [purple-affogato's contribution](https://purpleaffogatoicsportfolio.wordpress.com/isp/) as well.*

My role in the duo was The Sole Project Member. As the sole Project Member, I was in charge of implementing most of the code.
Since purple-affogato was talented in visual art etc, most of the art-related work was done by purple-affogato.

![The title screen background.]({{ base_path }}/assets/images/yukarikamome.png)

*Artwork above by purple-affogato.* (Original image taken by me! It's taken while crossing the Rainbow bridge using Yurikamome.)

More specifically, here are my contributions to the project:

### General Code Scaffolding/Cleanup 

I chose the game framework to use, [libGDX](https://libgdx.com/), as well as setup mechanisms like scene files ("daishi"), which decouples the script from the code:

```yaml
comment: Stage 3
lines:
  - label: start # can use `jump: start` in other parts ot jump here
    action: "" # reset state
    chain: true # directly proceed to next line
    persona: "bee" # set persona (icon) for story mode modal (telop)
  - ten: Instructions
    body: "Every bee has a very important task in its life."
  - body: "Which is to collect honey and pollinate the world! (triumph emoji)"
  - body: "Fly around with the WASD keys and collect enough pollen for your bee colony!"
```

### Splash, Main Menu, and Level Select Screens

I made the code for the splash, main menu, and level select screens. This included asset loading animations.

![The splash screen.]({{ base_path }}/assets/images/splash.png)

Kirby is so cute!

### Levels (Stages) 1 and 3

I made the code and mechanics for levels 1 and 3. The hardest part was using the physics engine, [Box2D](https://box2d.org/) as I haven't used it before.

![purple-affogato playing the game.]({{ base_path }}/assets/images/PXL_20230609_173338319.jpg)

Since the scoring uses the sigmoid function, 28469 is surprisingly hard to do. Also, it gets more difficult as the speed increases.

## Game Demo

You can watch the [Demo Video on YouTube](https://youtu.be/T95pYZif1uA).
