![](https://img.shields.io/badge/Microverse-blueviolet)

# JSON Linter

> Ruby is a beautiful programming language that was designed for programmer productivity. It comes feature-packed with numerous inbuilt classes and methods to make programming enjoyable for developers.
>
> According to Wikipedia, JSON(JavaScript Object Notation) is an open standard file format and data interchange format. It uses human-readable text to store and transmit data objects. JSON files consist of attribute-value pairs and arrays (or other serializable values).
>
> In today's development world, JSON is one of the popular data formats. Although it was derived from JavaScript, it a language-independent format. Many languages come with an inbuilt JSON parser. It is also a light-weight format and, it is human-readable.
>
> This project aims to use some of Ruby's inbuilt methods to build a JSON linter. The project will continue to evolve and be updated. I hope you find it helpful.

<br/><br/>

## Linter Description📄

**This JSON linter** checks for the following errors/warnings:<br>

1. Check empty line error
2. Check for missing/unexpected tags i.e. '( )', '[ ]', and '{ }'
3. Check for the wrong indentation
4. Check for the malformed fractions
5. Check for the leading zeros
6. Check new line at end of JSON

#### Below you can see good, bad and empty JSON files and their test results on the console

<br/>

**Well formed JSON passes the test successfully!**

```JSON
# Well Formed JSON
{
  "firstName": "John",
  "lastName": "Snow",
  "age": 25,
  "children": [],
  "spouse": null,
  "address": {
    "street": "7504 Taylor Drive",
    "city": "New York City",
  },
  "phoneNumbers": [
    {
      "type": "mobile",
      "number": "212 555-3346"
    }
  ]
}
```

Console output
<img src="./doc/img/good_code.png" alt="" style="width: 100%;">

<br/>

**Badly formed JSON fails the test**

```JSON
# Badly formed JSON
{
  "openObject": {
  "improperIndent": "string 0"
    "leadingZero": {"example": 01},

    "unterminatedFraction": {"example": .1},
    "openObject": {
      "street": "7504 Taylor Drive",
      "city": "New York City",
      "state": "New York",
      "postalCode": "11238"
  ]
```

Console output
<img src="./doc/img/bad_code.png" alt="" style="width: 100%;">

<br/>

**Empty JSON file shows a warning to the user!**

```JSON
# Empty JSON File




```

Console output
</br>
<img src="./doc/img/empty_code.png" alt="" style="width: 100%;">

<br/>

## Content

- [Built With](#built-with)
- [Live Demo](#live-demo)
- [Getting started](#getting-started)
- [Prerequisites](#prerequisites)
- [Setup](#setup)
- [Usage](#usage)
- [Testing](#testing)
- [Author](#author)
- [Contributing](#contributing)
- [Show your support](#show-your-support)
- [License](#license)

## Built With

- Ruby
- RSpec

## Live Demo

You can check out the live demo [here](https://replit.com/join/qkpymnmloi-joshuaivie)

## Getting Started

To get a local copy up and running, follow these simple example steps.

- Install the prerequisites on your local machine
- Clone the repository to your local machine as described in the setup section
- run the enumerable.rb file using ruby in your terminal as described in the usage section

### Prerequisites

1. Code Editor
2. Terminal (Bash)
3. Git
4. Ruby

### Setup

- Open your terminal and navigate to the location in which you would like to setup your copy of the project.
- Run the following command in your terminal

```console
git clone https://github.com/joshuaivie/mv-rb_JSON-Linter/
```

### Usage

- Ensure you're in the directory in which you've set up the project
- Run the following command replacing the relative file path with the path of the file you wish to test

```console
bin/main.rb [./relative/file/path]
```

## Testing

This project uses the ruby spec gem for testing.

```console
gem install rspec &&  cd mv-rb_JSON-Linter && rspec
```

## Author

👤 **Joshua Ivie**

- GitHub: [@joshuaivie](https://github.com/joshuaivie)
- Twitter: [@joshuaivie\_](https://twitter.com/joshuaivie_)
- LinkedIn: [joshuaivie](https://linkedin.com/in/joshuaivie)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/joshuaivie/mv-rb_JSON-Linter/issues).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](./LICENSE.md) licensed.
