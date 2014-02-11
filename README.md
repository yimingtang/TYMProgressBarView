# TYMProgressBarView

A progress bar which is similar to the one on iOS's launching screen. All the drawing stuffs are implemented with Core Graphics in order to achieve high performance and feel comfortable for resizing.

![Screenshot](https://raw2.github.com/krafttuc/TYMProgressBarView/master/Screenshot.png)

## Usage

``` obj-c
// Create a progress bar view and set its appearance
TYMProgressBarView *progressBarView = [[TYMProgressBarView alloc] initWithFrame:aFrame];
progressBarView.barBorderWidth = 1.0f;
progressBarView.barBorderColor = yourColor;

// Add it to your view
[yourView addSubview:progressBarView];

// Set the progress
progressBarView.progress = 0.2f;
progressBarView.progress = 0.5f;
```

See [TYMProgressBarView.h](https://github.com/krafttuc/TYMProgressBarView/blob/master/TYMProgressBarView/TYMProgressBarView.h) for the full documentation.

## Adding To Your Project

Download the source files or add it as a git submodule. Add `TYMProgressBarView.h` and `TYMProgressBarView.m` to your project.

TYMProgressBarView uses [Automatic Reference Counting (ARC)](http://clang.llvm.org/docs/AutomaticReferenceCounting.html). It also requires the `Core Graphics` frameworks.

TYMProgressBarView is tested on both iOS 6 and iOS 7.

## Thanks

The code is based on [DDProgressView by Damien DeVille](https://github.com/ddeville/DDProgressView) and [SSPieProgressView by Sam Soffes](https://github.com/soffes/sstoolkit).

## LICENSE

TYMProgressBarView is available under the MIT license. See the LICENSE file for details.
