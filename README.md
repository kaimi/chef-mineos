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

License and Authors
-------------------
Authors: ka’imi <kaimi@kaimi.cc>
