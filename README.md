# Custom Ruby Enumerable Methods

This project is part of a series of projects to be completed by students of [Microverse](https://www.microverse.org/ "The Global School for Remote Software Developers!").
The motive of this project is to replicate some enumerable methods in Ruby.This is an application of  the concept learnt on  Enumerable module that gets mixed into the Array and Hash classes.This seek to reinforce the knowledge on Ruby's enumerable methods.

>The selected method replicated in this project are:
- ```each```
- ```each_with_index```
- ```select```
- ```all?```
- ```any?```
- ```none?```
- ```count```
- ```map```
- ```inject```

>replicated as:

- ```my_each```
- ```my_each_with_index```
- ```my_select```
- ```my_all?```
- ```my_any?```
- ```my_none?```
- ```my_count```
- ```my_map```
- ```my_inject```  

## Technologies

- Ruby

## Usage

> Clone the repository to your local machine

```sh
$ git clone https://github.com/forison/custom_enum.git
```

> cd into the directory

```sh
$ cd custom_enum
```

> open enum_methods with your favourite text editor or with irb.

## Deployment
 
>load the module and use our custom methods

```ruby
require "enum-methods"
```
>using custom  ```my_inject``` method in multiply_els(arg) method

```
    def multiply_els(arr)
      arr.my_inject { |product, value| product * value}
   end
   ar=[2,4,5]

   multiply_els(ar) 
```
>outputs

```
   #=> 40
```

## Contributor

 [Boakye Addo Forison](https://github.com/Forison)

## Contributing

1. Fork it (https://github.com/forison/custom_enum/fork)
2. Create your feature branch (git checkout -b feature/[choose-a-name])
3. Commit your changes (git commit -am 'What this commit will fix/add')
4. Push to the branch (git push origin feature/[chosen name])
5. Create a new Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE.md) file for details
