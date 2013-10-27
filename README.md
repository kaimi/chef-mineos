mineos Cookbook
===============
This cookbook installs [mineos](http://codeemo.com) on a fresh ubuntu system.
Refer to <http://codeemo.com/mineoswiki/index.php?title=Ubuntu> for further
information.

Requirements
------------

#### OS
- Ubuntu

#### packages
- `chef` :)
- [chef-apt-repo cookbook](https://github.com/sometimesfood/chef-apt-repo "github: chef-apt-repo cookbook")

Attributes
----------
None.

Usage
-----
Just include `mineos` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[mineos]"
  ]
}
```

Contributing
------------

I am using nvie’s
[git branching model](http://nvie.com/posts/a-successful-git-branching-model/ 
"nvie.com: A successfull Git branichng model"). To contribute you should follow 
these steps:

0. Check if your proposed change is already implemented in the `develop` branch
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request against the `develop` branch using Github

License and Authors
-------------------
Authors: ka’imi <kaimi@kaimi.cc>
