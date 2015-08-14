fedora-mock Cookbook
====================
Installs [Fedora Mock](https://fedoraproject.org/wiki/Mock?rd=Subprojects/Mock)

master branch: [![Build Status](https://travis-ci.org/st-isidore-de-seville/cookbook-fedora-mock.svg?branch=master)](https://travis-ci.org/st-isidore-de-seville/cookbook-fedora-mock)
develop branch: [![Build Status](https://travis-ci.org/st-isidore-de-seville/cookbook-fedora-mock.svg?branch=develop)](https://travis-ci.org/st-isidore-de-seville/cookbook-fedora-mock)

Requirements
------------
- Chef 11 or higher
- Ruby 1.9 or higher (preferably from the Chef full-stack installer)
- Network accessible package repositories
- Fedora Mock is only accessible on Fedora & RHEL platform families
- yum-epel Cookbook (only executed on RHEL platforms families)

Attributes
----------
#### fedora-mock::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['fedora-mock']['include-epel']</tt></td>
    <td>Boolean</td>
    <td>
      Does this cookbook automatically include the EPEL respository?
    </td>
    <td><tt>true if a RHEL platform family; false if Fedora</tt></td>
  </tr>
  <tr>
    <td><tt>['fedora-mock']['plugins']</tt></td>
    <td>Hash</td>
    <td>
      Additional Fedora Mock plugins to install.  The hash key is the plugin.
      If the hash value evaluates to true, the plugin will be installed.
    </td>
    <td><tt>empty</tt></td>
  </tr>
  <tr>
    <td><tt>['fedora-mock']['users']</tt></td>
    <td>Hash</td>
    <td>
      Users of Fedora Mock.  The hash key is the user.  If the hash value
      evaluates to true, the user will be a managed group of Fedora Mock.
    </td>
    <td><tt>empty</tt></td>
  </tr>
</table>

Usage
-----
#### fedora-mock::default
Just include `fedora-mock` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[fedora-mock]"
  ]
}
```

Contributing
------------
1. Fork the repository on GitHub
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using GitHub

Development Environment
-------------------

The development environment for this repository consists of:
* [ChefDK](https://downloads.chef.io/chef-dk/)
* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* [Vagrant](http://www.vagrantup.com/downloads.html)
* your favorite text editor or IDE

`rake` and `kitchen` may be run as subcommands of `chef exec`.  If you have
`chef shell-init` initialized in your environment, you may call these commands
independent of `chef exec`.

The Vagrantfile is built on Ubuntu Trusty and includes ChefDK, Docker and the
kitchen-docker ruby gem.  Integration testing in this environment can be
performed using kitchen-docker.  The KITCHEN_YAML environment variable is set to
use the .kitchen.docker.yml configuration file.

The Vagrant environment can be spun up by performing the following commands:

1. `vagrant up`
2. `vagrant ssh`
3. `cd /vagrant/`

`chef shell-init` is included as part of the vagrant user's environment so
commands such as `rake` and `kitchen` can be executed without having to call it
as part of a subcommand of `chef exec`.

Authors
-------------------
- Author:: St. Isidore de Seville (<st.isidore.de.seville@gmail.com>)

License
-------------------

```text
The MIT License (MIT)

Copyright (c) 2015 St. Isidore de Seville (st.isidore.de.seville@gmail.com)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
