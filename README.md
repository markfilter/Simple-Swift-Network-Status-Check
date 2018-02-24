[![Build Status](https://travis-ci.org/markfilter/Simple-Swift-Network-Status-Check.svg?branch=master)](https://travis-ci.org/markfilter/Simple-Swift-Network-Status-Check)

# Simple-Swift-Network-Status-Check
It's amazing how complex Apple has made it to check for an app's network connectivity status in comparison to Android's simplistic implementation. This project bypasses subscribing to Notification Center and does a simple check for server responses on specific events, like viewDidLoad and right before network transactions.

### Usage
Use the method to send a simple request to the target server to determine if the target server is accessible. To determine if your Internet connection is truly good, then target a web address that is too big to fail, like https://www.google.com. Overload the method and you can check for general Internet connectivity by targeting Google, and then your secondary method to target your personal server or API endpoint server.

### Checks Server Connection & Handles Error Messaging
![Gif image showing network connection check 1](https://github.com/markfilter/Simple-Swift-Network-Status-Check/blob/master/images/IMB_k6BOqv.GIF)

![Gif image showing network connection check 2](https://github.com/markfilter/Simple-Swift-Network-Status-Check/blob/master/images/IMB_ECs1Rf.GIF)

![Gif image showing network connection check 3](https://github.com/markfilter/Simple-Swift-Network-Status-Check/blob/master/images/IMB_ACwBbp.GIF)


## License

This project is licensed under the MIT License - see the [MIT](https://opensource.org/licenses/MIT) for details
