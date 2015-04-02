# TYMProgressBarView

[![CI Status](http://img.shields.io/travis/yimingtang/TYMProgressBarView.svg?style=flat)](https://travis-ci.org/yimingtang/TYMProgressBarView)
[![Version](https://img.shields.io/cocoapods/v/TYMProgressBarView.svg?style=flat)](http://cocoapods.org/pods/TYMProgressBarView)
[![License](https://img.shields.io/cocoapods/l/TYMProgressBarView.svg?style=flat)](http://cocoapods.org/pods/TYMProgressBarView)
[![Platform](https://img.shields.io/cocoapods/p/TYMProgressBarView.svg?style=flat)](http://cocoapods.org/pods/TYMProgressBarView)

A progress bar which is similar to the one on iOS's launching screen. All the drawing stuffs are implemented with Core Graphics in order to achieve high performance and feel comfortable for resizing.

TYMProgressBarView supports iOS 7.0 and later.

## Screenshot

![screenshot](https://github.com/yimingtang/TYMProgressBarView/blob/master/Screenshot.gif?raw=true)


## Usage

``` obj-c
// Create a progress bar view and set its appearance
TYMProgressBarView *progressBarView = [[TYMProgressBarView alloc] initWithFrame:aFrame];
progressBarView.barBorderWidth = 1.0;
progressBarView.barBorderColor = yourColor;

// Add it to your view
[yourView addSubview:progressBarView];

// Set the progress
progressBarView.progress = 0.2f;
progressBarView.progress = 0.5f;
```

You can also customize the appearance through the UIAppearance proxy. See [TYMProgressBarView.h](https://github.com/yimingtang/TYMProgressBarView/blob/master/TYMProgressBarView/TYMProgressBarView.h) for full documentation.


## Installation

### Manually

Download the source files or add it as a git submodule. Add `TYMProgressBarView.h` and `TYMProgressBarView.m` to your project.

TYMProgressBarView uses [Automatic Reference Counting (ARC)](http://clang.llvm.org/docs/AutomaticReferenceCounting.html). It also requires the `Core Graphics` framework.

### CocoaPods

TYMProgressBarView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

``` ruby
pod 'TYMProgressBarView'
```


## Thanks

The code is based on [DDProgressView by Damien DeVille](https://github.com/ddeville/DDProgressView) and [SSPieProgressView by Sam Soffes](https://github.com/soffes/sstoolkit).


## LICENSE

TYMProgressBarView is available under the MIT license. See the LICENSE file for details.
